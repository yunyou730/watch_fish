using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;
using System;

namespace watchfish
{
    public class Launcher : MonoBehaviour
    {
        LuaEnv  _luaEnv = null;

        private Action _luaStart;
        private Action _luaUpdate;
        private Action _luaOnDestroy;

        
        void Awake()
        {
            _luaEnv = new LuaEnv();
            _luaEnv.DoString("CS.UnityEngine.Debug.Log('welcome to watchfish')");
            _luaEnv.AddLoader(MyLoader);
            _luaEnv.DoString("require('launcher')");

            _luaEnv.Global.Get("Start",out _luaStart);
            _luaEnv.Global.Get("Update",out _luaUpdate);
            _luaEnv.Global.Get("OnDestroy",out _luaOnDestroy);
        }    

        void OnDestroy()
        {
            if(_luaOnDestroy != null)
            {
                _luaOnDestroy();
            }       
            _luaStart = null;
            _luaUpdate = null;
            _luaOnDestroy = null;

            _luaEnv.Dispose();
            _luaEnv = null;
        }

        void Start()
        {
            if(_luaStart != null)
            {
                _luaStart();
            }
        }

        void Update()
        {
            if(_luaUpdate != null)
            {
                _luaUpdate();
            }
        }


        private byte[] MyLoader(ref string filename)
        {
            filename = filename.Replace(".","/");
            string rootPath = Application.dataPath;
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
        
        public void OnClickTest()
        {
            _luaStart = null;
            _luaUpdate = null;
            _luaOnDestroy = null;            
        }
    }
}
