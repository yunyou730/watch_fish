using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace  watchfish
{
    public class TestMono : MonoBehaviour
    {
        // Start is called before the first frame update
        void Start()
        {
            Debug.Log("This is TestMono,name:" + gameObject.name);
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
