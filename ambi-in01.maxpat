{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 128.0, 118.0, 633.0, 267.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "kiwi",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 78.0, 36.0, 41.0, 20.0 ],
					"text" : "plugin~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 91.0, 102.0, 20.0 ],
					"text" : "plugsend~ ambi-in01"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0,
		"default_bgcolor" : [ 0.223529411764706, 0.23921568627451, 0.36078431372549, 1.0 ],
		"color" : [ 1.0, 1.0, 1.0, 1.0 ],
		"elementcolor" : [ 0.564705882352941, 0.603921568627451, 0.905882352941176, 1.0 ],
		"accentcolor" : [ 0.552941176470588, 0.588235294117647, 0.850980392156863, 1.0 ],
		"patchlinecolor" : [ 0.450980392156863, 0.490196078431373, 0.776470588235294, 1.0 ],
		"bgcolor" : [ 0.72156862745098, 0.737254901960784, 0.850980392156863, 1.0 ],
		"editing_bgcolor" : [ 0.72156862745098, 0.737254901960784, 0.850980392156863, 1.0 ],
		"bgfillcolor_type" : "color",
		"bgfillcolor_color" : [ 0.486274509803922, 0.541176470588235, 0.925490196078431, 1.0 ],
		"bgfillcolor_color1" : [ 0.486274509803922, 0.541176470588235, 0.925490196078431, 1.0 ],
		"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.5,
		"bgfillcolor_autogradient" : 0.0
	}

}
