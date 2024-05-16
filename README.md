# coolbox
This image has minor tweaks to the upstream fedora-toolbox:

- DNF no longer prompts for confirmation
- DNF5 is installed
- Various extra software repositories are enabled, but not installed:
  - Microsoft VS Code and PowerShell
  
To use coolbox as the default toolbox image, simply execute

```
toolbox create -c fedora-toolbox-$(rpm -E %fedora) -i ghcr.io/j0hax/coolbox:main
```

and enter with `toolbox enter`.

## Thanks
This project was inspired by Rasmus Thomsen's article [Fedora Toolbox with custom container images](https://www.cogitri.dev/posts/12-fedora-toolbox/).
