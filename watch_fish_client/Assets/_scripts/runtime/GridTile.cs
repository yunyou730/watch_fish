using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace watchfish
{
    public class GridTile : MonoBehaviour
    {

        public enum ETileColor
        {
            Odd,
            Even,
            Max,
        }

        MeshRenderer    _meshRenderer = null;
        Material        _mainMat      = null;


        void Awake()
        {
            _meshRenderer = GetComponent<MeshRenderer>();
            _mainMat = _meshRenderer.materials[0];
        }

        public void SetTileColor(ETileColor tileColor)
        {
            switch(tileColor)
            {
            case ETileColor.Odd:
                _mainMat.SetColor("_Color",Color.green);
                break;
            case ETileColor.Even:
                _mainMat.SetColor("_Color",Color.yellow);
                break;
            default:
                break;
            }
        }

    }
}
