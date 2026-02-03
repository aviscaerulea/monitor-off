#include <windows.h>

// デスクトップロック & モニタ電源 OFF ツール
// ショートカットキーに登録して使用することを想定
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd) {
    // ショートカットキーのキーリリースを待機
    Sleep(1000);

    // デスクトップをロック
    LockWorkStation();

    // モニタをオフにする (lParam: 2=OFF, 1=低電力, -1=ON)
    SendMessage(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, (LPARAM)2);

    return 0;
}
