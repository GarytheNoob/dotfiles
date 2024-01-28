# On the configuration of Alacritty

I am using a different configure strategy. Here's the file structure:

``` text
~/.config/alacritty
├── alacritty.yml
├── onedark.yml
...
```

In this case, all Alacritty windows are launched with the following pattern:
```bash
alacritty --config-file ~/.config/{theme_name}.yml
```

The files represent different color scheme, and share the remaining part of 
configuration simply by importing the `alacritty.yml` file at their beginning.
