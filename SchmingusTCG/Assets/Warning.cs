using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Warning : MonoBehaviour
{
    public TextMeshProUGUI message;

    public void UserNotFound()
    {
        gameObject.SetActive(true);
        message.text = "User Not Found!";
        Invoke("Clear", 2f);
    }

    public void PasswordWrong()
    {
        gameObject.SetActive(true);
        message.text = "Incorrect Password!";
        Invoke("Clear", 2f);
    }

    public void UsernameTaken()
    {
        gameObject.SetActive(true);
        message.text = "Username Taken!";
        Invoke("Clear", 2f);
    }

    public void Registered()
    {
        gameObject.SetActive(true);
        message.text = "Registered!";
        Invoke("Clear", 2f);
    }

    void Clear()
    {
        gameObject.SetActive(false);
    }
}
