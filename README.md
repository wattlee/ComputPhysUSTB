# ComputPhysUSTB
This is a repository of Computational Physics, taught by Prof. Fuyang Tian, in USTB. We can commit and download all the source codes in this repository.
## How to use github
### 环境部署
1. GitHub是基于Git的，下载Git工具（这不是GitHub，是Git，最基本的依赖工具）：https://git-scm.com/downloads
2. 下载页面选64-bit Git for Windows Setup；
3. 安装全部下一步；
4. 生成Git SSH Key（这一步必须，否则不能提交或者Clone代码），参考此教程：http://blog.csdn.net/lsyz0021/article/details/52064829
### 安装Github客户端和克隆
1. 注册账号并在github.com下载GitHubDesktopSetup.exe；
2. 打开即可用，并且登录你的GitHub账号，过程中可能需要输入用户名和邮箱，对应你的GitHub用户名和邮箱即可；
3. 进入主界面后，依次选择File->Clone Repository, 使用URL：https://github.com/wattlee/ComputPhysUSTB，点击Clone即可克隆到本地电脑。
### 分支管理和代码
1. 默认的Branch是主分支。由于这是课程主页，不是合作开发，因此不必创建分支，当然，想创建分支的话也是可以的，每个人用自己的分支这样会更加清晰简洁。
2. 点Current branch会展开一个菜单，然后点New就是创建新分支，创建好自己的分支后，由于你只是在本地操作，还需要把分支推送到GitHub服务器。命令是 Push Repository
### 提交代码或作业文件
1. 本地修改代码（产生了change）
2. 填写提交信息，这里的Summary是必填项，说明你这个change主要是做了什么（比如改了什么地方，上传了什么文件），Description是非必填的，可以详细描述一下自己的代码为什么这么写。提交（commit）代码到自己的分支，注意这个时候代码都只是在本地，并没有同步到服务器。
3. 推送（push）到远程仓库，完成了一次代码提交。提交成功后还可以Undo撤销，然后我们可以看到History当中已经有你刚才的commit了，这个时候直接点击Push origin，即可把修改后的代码推送到远程仓库。
注意：必须要在你Clone下来的Reposity所在文件夹中更改相关文件，否则Github客户端无法识别到更改。文件夹可以通过右键仓库名称显示出的菜单中的open in finder找到（Mac下）。



