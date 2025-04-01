using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ClearCoal : MonoBehaviour
{
    void OnEnable()
    {
        foreach(Animator guh in GetComponentsInChildren<Animator>())
        {
            Debug.Log(guh.gameObject.name);
            if (guh.gameObject.name == "Coal(Clone)")
                Destroy(guh.gameObject);
        }
    }
}
