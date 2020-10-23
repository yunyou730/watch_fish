using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEditor;

namespace  watchfish
{
    public class TestMono : MonoBehaviour
    {
        // Start is called before the first frame update
        void Awake()
        {
            Debug.Log("This is TestMono,name:" + gameObject.name);
#if UnityEditor
            GameObject go = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/_res/menu/menu_entry.prefab");
            go = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/_res/menu/menu_entry");
            Debug.Log("xx");
#endif
        }

        // Update is called once per frame
        void Update()
        {
            //Debug.Log("earn money");
        }
    
        public void TestFunc(string str)
        {
            Debug.Log("This is test func,str " + str);
            gameObject.name = gameObject.name + " | " + str;
        }
    
        public static TestMono Add(GameObject go)
        {
            return go.AddComponent<TestMono>();
        }
    }
    
}
