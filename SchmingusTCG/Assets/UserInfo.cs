using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserInfo : MonoBehaviour
{
    public string UserID { get; private set; }
    public string UserName, Level, Money;
    string UserPassword;
    public SetMoney setMoney;

    public void SetCredentials(string username, string userpassword)
    {
        UserName = username;
        UserPassword = userpassword;
    }
    public void SetInfo(string info)
    {
        string[] infoParts = info.Split('\n');
        UserID = infoParts[0];
        Money = infoParts[1];
    }
}
