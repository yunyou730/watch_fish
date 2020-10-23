using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

namespace watchfish
{
    public class ResLoaderExt
    {
        public static GameObject LoadPrefab(string path)
        {
            return ResLoader.GetInstance().Load<GameObject>(path);
        }
    }
}
