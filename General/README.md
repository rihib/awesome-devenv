# General

```bash
cd <PRJ_ROOT>
echo "export <PRJ_NAME>_ROOT=<PRJ_ROOT_PATH>" >> ~/.bashrc
echo "export <PRJ_NAME>_ROOT=<PRJ_ROOT_PATH>" >> ~/.bash_profile
echo "export <PRJ_NAME>_ROOT=<PRJ_ROOT_PATH>" >> ~/.profile
source ~/.bashrc
source ~/.bash_profile
source ~/.profile
exec $SHELL
echo $<PRJ_NAME>_ROOT
```
