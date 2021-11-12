import winreg

# This code refers to https://blog.csdn.net/fengleitao/article/details/81913538

KEY_ProxyEnable = "ProxyEnable"
KEY_ProxyServer = "ProxyServer"
KEY_ProxyOverride = "ProxyOverride"
KEY_XPATH = "Software\Microsoft\Windows\CurrentVersion\Internet Settings"

def SetProxy(enable, proxyIp, IgnoreIp):
    hKey = winreg.OpenKey(winreg.HKEY_CURRENT_USER, KEY_XPATH, 0, winreg.KEY_WRITE)
    winreg.SetValueEx(hKey, KEY_ProxyEnable, 0, winreg.REG_DWORD, enable)
    winreg.SetValueEx(hKey, KEY_ProxyServer, 0, winreg.REG_SZ, proxyIp)
    winreg.SetValueEx(hKey, KEY_ProxyOverride, 0, winreg.REG_SZ, IgnoreIp)
    winreg.CloseKey(hKey)

# 获取当前代理状态
def GetProxyStatus():
    hKey = winreg.OpenKey(winreg.HKEY_CURRENT_USER, KEY_XPATH, 0, winreg.KEY_READ)
    retVal = winreg.QueryValueEx(hKey, KEY_ProxyEnable)
    winreg.CloseKey(hKey)
    return retVal[0]==1

def main():
    hostlist = {
        'local': "127.0.0.1:1091",
    }

    if GetProxyStatus():
        SetProxy(0, "", "")
        print("关闭代理")
    else:
        host = input('Please type host: ')
        if host == '':
            host = hostlist['default']
        elif host in hostlist:
            host = hostlist[host]

        print(host)

        SetProxy(1, host, "172.*;192.*;")
        print("打开代理")

    input('Pause...')
if __name__ == '__main__':
    main()