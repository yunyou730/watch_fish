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

        [MenuItem("watchfish/Copy Lua Files")]
        static void CopyLuaFiles()
        {
            if(Directory.Exists(Application.persistentDataPath))
            {
                Directory.Delete(Application.persistentDataPath,true);
            }
            Directory.CreateDirectory(Application.persistentDataPath);
            
            string srcPath = Application.dataPath + "/lua";
            string destPath = Application.persistentDataPath + "/lua";
            CopyDirectory(srcPath,destPath);
            Debug.LogWarning("Copy Lua Done:" + destPath);
        }

        static void CopyDirectory(string src,string dest)
        {
            if(!Directory.Exists(dest))
            {
                Directory.CreateDirectory(dest);
            }

            string[] files = Directory.GetFiles(src);
            for(int i = 0;i < files.Length;i++)
            {
                string[] filenameSplited = files[i].Split('\\');
                string fileName = filenameSplited[filenameSplited.Length - 1];
                if(fileName.EndsWith(".lua"))
                {
                    File.Copy(files[i],dest + "/" + fileName);
                }   
            }

            string[] subdirs = Directory.GetDirectories(src);
            int srcLen = src.Length;
            for(int i = 0;i < subdirs.Length;i++)
            {
                int subDirLen = subdirs[i].Length;
                string subDirName = subdirs[i].Substring(srcLen);
                string[] tempDirs = subDirName.Split('\\');
                subDirName = tempDirs[tempDirs.Length - 1];
                CopyDirectory(subdirs[i],dest + "/" + subDirName);
            }
            
        }
    }
}
