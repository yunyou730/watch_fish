using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

namespace watchfish
    {
    public class ABPacker
    {
        [MenuItem("watchfish/Build AssetBundles Windows")]
        static void BuildAssetBundlesWindows()
        {
            string destDirectory = Application.persistentDataPath;
            if(!Directory.Exists(destDirectory))
            {
                Directory.CreateDirectory(destDirectory);
            }
            BuildPipeline.BuildAssetBundles(destDirectory,BuildAssetBundleOptions.None,BuildTarget.StandaloneWindows);
            Debug.LogWarning("AB build done: " + destDirectory);
        }
    }

}
