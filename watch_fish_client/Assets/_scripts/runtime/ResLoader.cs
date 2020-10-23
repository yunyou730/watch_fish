using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

namespace watchfish
{
    public class ResLoader
    {
        private static ResLoader s_instance = null;

#if UNITY_EDITOR
        private bool _simulateRealEnvInEditor = false;
#endif

        Dictionary<string,AssetBundle>  _assetBundleMap = new Dictionary<string, AssetBundle>();

        public static ResLoader GetInstance()
        {
            if(s_instance == null)
            {
                s_instance = new ResLoader();
            }
            return s_instance;
        }

#if UNITY_EDITOR
        public void SimulateEnvInEditor(bool bSim)
        {
            _simulateRealEnvInEditor = bSim;
        }
#endif

        public T Load<T>(string path) where T:UnityEngine.Object
        {
            T result = null;

            string[] pathWithSep = path.Split('/');
            if(pathWithSep.Length < 2)
            {
                Debug.LogWarning("Error asset path:" + path);
                return null;
            }

            string abName = pathWithSep[pathWithSep.Length - 2];
#if UNITY_EDITOR
            if(_simulateRealEnvInEditor)
            {
                string prePath = "Assets/_res/";
                result = DoLoad<T>(abName,prePath + path);
            }
            else
            {
                string prePath = "Assets/_res/";
                result = AssetDatabase.LoadAssetAtPath<T>(prePath + path);
            }
#else
            string prePath = "Assets/_res/";
            result = DoLoad<T>(abName,prePath + path);
#endif
            return result;
        }

        public string GetLuaRootPath()
        {
#if UNITY_EDITOR
            if(!_simulateRealEnvInEditor)
            {
                return Application.dataPath;
            }
#endif
            return Application.persistentDataPath;
        }
        
        private T DoLoad<T>(string abPath,string path) where T : UnityEngine.Object
        {
            AssetBundle ab = CheckAndLoadAB(abPath);
            return ab.LoadAsset<T>(path);
        }

        private AssetBundle CheckAndLoadAB(string abPath)
        {
            if(!_assetBundleMap.ContainsKey(abPath))
            {
                string rootPath = Application.persistentDataPath;
                string fullPath = rootPath + "/" + abPath;
                AssetBundle ab = AssetBundle.LoadFromFile(fullPath);
                Debug.Assert(ab != null,"asset bundle load failed:" + fullPath);
                _assetBundleMap.Add(abPath,ab);
                return ab;
            }
            return _assetBundleMap[abPath];
        }
    }

}
