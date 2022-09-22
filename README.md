# 水理実験 P3 プログラム実習（海岸）

## Outlines
[Here](/README-en.md) for the English version  
このリポジトリは，京都大学工学部地球工学科　土木コース科目「水理実験」の一部として行われるプログラム実習（海岸）の課題資料です．
科目全体や他の課題については，履修者に配布されるガイダンス資料や水理実験指導書を参照してください．

当該科目以外の目的でこのリポジトリを利用することを妨げるものではありませんが，演習課題のため内容が不完全であることをご承知おきください．
また，ご利用は全て自己責任でお願いします（MITライセンスです）．

Terminalが利用できるLinux系OSやMac OS，WindowsではWSL2(Windows Subsystem for Linux 2)での利用を想定しています．

## Contents
- [テスト](/test) 本課題の実行環境テスト
- [課題1](/ex_small_amplitude_waves) 微小振幅波の理論式の可視化
- [課題2](/ex_waveeq_1d) 波速一定の1次元波動の伝播計算
- [課題3](/ex_longwave_1d) 1次元長波の斜面遡上計算

## Requirements
- GNU Make (Makefile)
- gfortran or any other Fortran compiler
- gnuplot v5.0 or later version

## Usage
Releases の tag から zip または tar.gz 形式のファイルをダウンロード・解凍してください．  
**当該科目履修者については，同じ内容の資料がPandAで配布されます.別途ダウンロード等をする必要はありません．**
GitHub のアカウントを持っている人は，このリポジトリをforkした後にgit cloneすることで，自分の開発環境でのバージョン管理が可能です．

```shell
git clone git@github.com:username/repositoryname
```

```shell
git clone https://github.com/username/repositoryname
```

## Notes
各自が行う演習課題のため，解答を含めたものをIssuesに投稿したり，Pull requestsを送信したりしないでください．
バグ等不具合をIssuesに投稿することは歓迎します．
この課題に直接関係のない質問に関しては，ガイダンス資料や実験指導書の連絡先をご確認ください．

## Examples
<p align="center">
<img src="/fig/wave1d_bc_comparison.gif", width="400">
<img src="/fig/ex_longwave.gif", width="400">
</p>

## License

[MIT](/LICENSE)

## Author

Takuya Miyashita (miyashita.takuya.4w $AT$ kyoto-u.ac.jp)
Disaster Prevention Research Institute, Kyoto University
Latest update: 2022 September
