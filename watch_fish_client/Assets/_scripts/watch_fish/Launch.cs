using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using XLua;

namespace watchfish
{
    public class Launch : MonoBehaviour
    {
        public TextAsset    _luaEntry = null;
        XLua.LuaEnv         _luaEnv = null;
        public bool         _shallSimulateEnvRes = false;


        public delegate void LuaStartDelegate();
        [CSharpCallLua]
        public delegate void LuaUpdateDelegate(float deltaTime);


        LuaStartDelegate    _luaStartFunc = null;
        LuaUpdateDelegate   _luaUpdateFunc = null; 

        void Awake()
        {
#if UNITY_EDITOR
            ResLoader.GetInstance().SimulateEnvInEditor(_shallSimulateEnvRes);
#endif
        }

        void Start()
        {
            _luaEnv = new XLua.LuaEnv();
            _luaEnv.AddLoader(MyLoader);
            _luaEnv.DoString(_luaEntry.text);

            _luaStartFunc = _luaEnv.Global.Get<LuaStartDelegate>("CSCall_LuaStart");
            _luaUpdateFunc = _luaEnv.Global.Get<LuaUpdateDelegate>("CSCall_LuaUpdate");

            if(_luaStartFunc != null)
            {
                _luaStartFunc();
            }
        }

        void Update()
        {
            if(_luaUpdateFunc != null)
            {
                _luaUpdateFunc(Time.deltaTime);
            }

            if(UnityEngine.Input.GetKeyDown(UnityEngine.KeyCode.F1))
            {
                Debug.Log("xx");
            }
        }

        void OnDestroy()
        {
            _luaStartFunc = null;
            _luaUpdateFunc = null;

            _luaEnv.Dispose();
            _luaEnv = null;
        }

        private byte[] MyLoader(ref string filename)
        {
            filename = filename.Replace(".","/");
            string rootPath = ResLoader.GetInstance().GetLuaRootPath();
            string luaPath = rootPath + "/lua";
            string fullPath = luaPath + "/" + filename + ".lua";
            if(!Directory.Exists(luaPath))
            {
                Directory.CreateDirectory(luaPath);
            }
            if(File.Exists(fullPath))
            {
                return File.ReadAllBytes(fullPath);
            }
            return null;
        }
    }

}
