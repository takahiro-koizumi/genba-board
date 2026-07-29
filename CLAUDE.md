# genba-board（現場配置ボード）

大田原工業 工事部の作業員配置管理Webアプリ。現場ごとの作業員配置を可視化・記録する。

## 構成
- **単一HTMLアプリ**。編集対象は `index.html` 1ファイルのみ
- その他: `manifest.json`, `icon.svg`, `serve.ps1`, `start.bat`, `start-network.bat`, `privacy.html`
- フレームワーク・ビルド工程なし（バニラJS + localStorage + Dropbox API）

## 起動・公開
- ローカル起動: `start.bat` ダブルクリック → http://localhost:8080/
- 公開URL: https://takahiro-koizumi.github.io/genba-board/
- デプロイ: `main` branch に push → GitHub Pages が自動公開
- リポジトリ: https://github.com/takahiro-koizumi/genba-board （Public）

## Dropbox連携
- App Key: `w0akss3w157oa53`（Full Dropbox型、`DBX_APP_KEY` 定数で `index.html` にハードコード）
- 保存先パス: `/★大田原工業　工事部/☆施工中/★現場配置ボード/board.json`
- localStorageキー: `genba_dbx_file_path`（kouteihyo/kintaiと同一github.ioオリジンを共有するため、必ず `genba_` 接頭辞を維持すること）
- 5秒ポーリングで他端末更新を取り込み。編集中・モーダル中はpullスキップ

## 編集ルール
- 修正は `index.html` を直接編集
- 区切りごとに git commit（小さくコミット）
- 動作確認は `start.bat` でローカル起動して実機ブラウザで確認してから push
- 顧客名・金額・個人情報を含むサンプルデータは `.gitignore` で公開除外

## 関連アプリ
- [kouteihyo](https://github.com/takahiro-koizumi/kouteihyo) ... 工程表アプリ。同じApp Key・同じgithub.ioオリジン
- [kintai](https://github.com/takahiro-koizumi/kintai) ... 勤怠管理アプリ。同じApp Key・同じgithub.ioオリジン
- 3アプリでlocalStorageのtokenを共有。保存パスのキーは必ずアプリ別接頭辞（`genba_` / `kouteihyo_` / `kintai_`）

## 詳細メモ
ユーザーのauto-memory `project_genba_board.md` に旧App Key履歴・Dropbox側設定・実装済み機能の詳細あり。
