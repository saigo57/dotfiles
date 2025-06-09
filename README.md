# install chezmoi
```
# mac
$ sh -c "$(curl -fsLS get.chezmoi.io)"

# windows
$ winget install twpayne.chezmoi
```

# chezmoiの設定
```
# ~/.config/chezmoi/chezmoi.toml
[data]
email = ""
name = ""
[edit]
command = "nvim"
```

# その他セットアップ
## fzf
fzfのリポジトリを~/.fzfにcloneしてきて、~/.fzf/installを実行

## z
zのリポジトリは~/zにcloneする(~/.zだと動かない)

# chezmoiコマンド
```
# chezmoiのgitディレクトリに移動
chezmoi cd

# 更新系のコマンド
chezmoi diff
chezmoi apply

# 追加コマンド
chezmoi add <file>
chezmoi add --template <file>
chezmoi chattr +template <file>
```
