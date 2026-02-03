# monitor-off

Windows でモニタ電源を OFF にし、デスクトップをロックするツール。

## 機能

- デスクトップロック (`LockWorkStation`)
- モニタ電源 OFF
- ウィンドウ非表示で実行

## 動作

1. 実行から 1 秒待機（ショートカットキーのキーリリース待ち）
2. デスクトップをロック
3. モニタ電源を OFF

## ビルド

### 必要な環境

- Visual Studio 2026
- CMake
- PowerShell 7.x

### ビルド手順

```powershell
# クリーンビルド
.\build.ps1 -Clean

# インクリメンタルビルド
.\build.ps1
```

実行ファイルは `build\Release\monitor-off.exe` に生成される。

## 使い方

実行ファイルを直接実行するか、ショートカットキーに登録して使用する。

```powershell
.\build\Release\monitor-off.exe
```

## ライセンス

MIT License
