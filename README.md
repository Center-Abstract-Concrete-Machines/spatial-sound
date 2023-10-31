# spatial-sound
spatial sound starter patches for TriTriangle workshop November 2023. Prepared by Kim Nucci and Garrett Laroy Johnson. 

# getting started
##  Software
- To run this code, you will need [MaxMSP]([url](https://cycling74.com/downloads)).
-Examples using p5*js and OSC communication will require a current installation of [node.js]([url](https://nodejs.org/en)). 
- For p5*js OSC examples, you may find it handy to run the bridge server through [Microsoft Visual Studio]([url](https://visualstudio.microsoft.com/)). 

## Library Dependencies 

- ICST ambisonic tool kit for Max/MSP. This should be installed via the [Max Package Manager]([url](https://docs.cycling74.com/max8/vignettes/package_manager)).  

## Included Dependencies

- Some examples also use [p5*js]([url](https://p5js.org/download/)). These examples will link to p5 using a CDN, so there is no need to download.
- The p5*js OSC bridge uses Gene Kogan's [p5js-osc repository]([url](https://github.com/genekogan/p5js-osc)https://github.com/genekogan/p5js-osc). That code is include here for convenience, and you do not need to download or install.

# architecture

The code is structured in the following way. there are multiple synthesis patches, which constitute the various examples. There is a single `multichannel-output.maxpat` patch, which is used in conjunction with all patches. 

`multichannel-output.maxpat` receives multiple audio streams via `receive~` that are send via `send~` from synthesis example patches.

Each synthesis patch also contains its own spatialization schema. This data is sent over to the `multichannel-output.maxpat` patch via Max's `send ambienencode` and `receive ambiencode`. Ambi here refers to [ambisonics]([url](https://en.wikipedia.org/wiki/Ambisonics#:~:text=Ambisonics%20is%20a%20full%2Dsphere,above%20and%20below%20the%20listener.)https://en.wikipedia.org/wiki/Ambisonics#:~:text=Ambisonics%20is%20a%20full%2Dsphere,above%20and%20below%20the%20listener.).

These messages are formatted to be legible to ICST objects. `multichannel-output.maxpat` routes these messages to ICST, which calculates the mix for the number of channels.

# Usage
## `multichannel-output.maxpat`
You will need to have `multichannel-output.maxpat` open to send audio out to speakers. 

Note the presets for different "standard" channel configurations. You can also edit the patch and store your own, for instance in the `coll` object. 
