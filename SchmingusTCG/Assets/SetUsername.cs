using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SetUsername : MonoBehaviour
{
    void OnEnable()
    {
        GetComponent<TextMeshProUGUI>().text = Main.Instance.userInfo.UserName;
    }
}
