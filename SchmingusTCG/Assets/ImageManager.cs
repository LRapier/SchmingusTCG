using SimpleJSON;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class ImageManager : MonoBehaviour
{
    public static ImageManager Instance;

    string _basePath;
    string _versionJsonPath;
    JSONObject _versionJson;

    void Start()
    {
        if(Instance != null)
        {
            GameObject.Destroy(this);
            return;
        }
        Instance = this;

        _basePath = Application.persistentDataPath + "/Images/";
        Debug.Log(_basePath);
        if(!Directory.Exists(_basePath))
        {
            Directory.CreateDirectory(_basePath);
        }

        _versionJson = new JSONObject();
        _versionJsonPath = _basePath + "VersionJson";

        if(File.Exists(_versionJsonPath))
        {
            string jsonString = File.ReadAllText(_versionJsonPath);
            _versionJson = JSON.Parse(jsonString) as JSONObject;
        }
    }

    bool ImageExists(string name)
    {
        return File.Exists(_basePath + name);
    }

    public void SaveImage(string name, byte[] bytes, int imgVer)
    {
        File.WriteAllBytes(_basePath + name, bytes);
        UpdateVersionJson(name, imgVer);
    }

    public byte[] LoadImage(string name, int imgVer)
    {
        if(!IsImageUpdated(name, imgVer))
            return new byte[0];

        if (ImageExists(name))
            return File.ReadAllBytes(_basePath + name);
        else
            return new byte[0];
    }

    public Sprite BytesToSprite(byte[] bytes)
    {
        Texture2D texture = new Texture2D(2, 2);
        texture.LoadImage(bytes);

        Sprite sprite = Sprite.Create(texture, new Rect(0, 0, texture.width, texture.height), new Vector2(0.5f, 0.5f));
        return sprite;
    }

    void UpdateVersionJson(string name, int ver)
    {
        _versionJson[name] = ver;
    }

    bool IsImageUpdated(string name, int ver)
    {
        if (_versionJson[name] != null)
            return _versionJson[name].AsInt == ver;
        else
            return false;
    }

    public void SaveVersionJson()
    {
        File.WriteAllText(_versionJsonPath, _versionJson.ToString());
    }
}
