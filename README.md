# .dots



## Git 

``` bash
  git init
  git remote add origin REMOTEURL
  git pull origin main
```

## Vim 

```Vim
  %s/oldword/newword/g
```

## Finding keys
```bash
  wev
```

## Adding a lang
* Uncomment lang from etc/locale.gen
* Run the next command to generate
```bash 
locale-gen
  ```
```
```
```
```
* Go to hypr config file and go to input
* add desired language to the kb_layout along side english
* (optional), add keybind by adding the next code
````
```bash
kb_options=grp:win_space_toggle
```
