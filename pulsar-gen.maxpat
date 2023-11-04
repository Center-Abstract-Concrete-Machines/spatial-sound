{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 6,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 870.0, 366.0, 640.0, 494.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
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
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"data" : 					{
						"patcher" : 						{
							"fileversion" : 1,
							"appversion" : 							{
								"major" : 8,
								"minor" : 5,
								"revision" : 6,
								"architecture" : "x64",
								"modernui" : 1
							}
,
							"classnamespace" : "dsp.gen",
							"rect" : [ 84.0, 132.0, 600.0, 450.0 ],
							"bglocked" : 0,
							"openinpresentation" : 0,
							"default_fontsize" : 12.0,
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
							"subpatcher_template" : "",
							"assistshowspatchername" : 0,
							"boxes" : [ 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "counter 1",
										"fontsize" : 12.0,
										"numinlets" : 2,
										"numoutlets" : 3,
										"fontname" : "Lato",
										"outlettype" : [ "", "", "" ],
										"id" : "obj-1",
										"patching_rect" : [ 117.0, 141.0, 61.0, 23.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "codebox",
										"fontsize" : 12.0,
										"numinlets" : 2,
										"numoutlets" : 1,
										"fontname" : "<Monospaced>",
										"outlettype" : [ "" ],
										"fontface" : 0,
										"id" : "obj-5",
										"patching_rect" : [ 117.0, 183.0, 267.0, 153.0 ],
										"code" : "// scale by formant\r\ns = in1 * in2;\r\n// clip at phase == 1\r\nclipped = clip(s, 0, 1);\r\n// convert this to a cosine window\r\nscaled = clipped*pi*2;\r\nout1 = (1.-cos(scaled))*0.5;"
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "param formant 2 @min 1",
										"linecount" : 2,
										"fontsize" : 12.0,
										"numinlets" : 0,
										"numoutlets" : 1,
										"fontname" : "Lato",
										"outlettype" : [ "" ],
										"id" : "obj-2",
										"patching_rect" : [ 365.0, 31.0, 105.0, 37.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "comment",
										"text" : "accumulate phase",
										"linecount" : 2,
										"fontsize" : 12.0,
										"numinlets" : 1,
										"numoutlets" : 0,
										"fontname" : "Lato",
										"id" : "obj-58",
										"patching_rect" : [ 27.0, 128.0, 75.0, 35.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "comment",
										"text" : "phase increment",
										"fontsize" : 12.0,
										"numinlets" : 1,
										"numoutlets" : 0,
										"fontname" : "Lato",
										"id" : "obj-49",
										"patching_rect" : [ 147.0, 82.0, 101.0, 21.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "!/ 1",
										"fontsize" : 12.0,
										"numinlets" : 1,
										"numoutlets" : 1,
										"fontname" : "Lato",
										"outlettype" : [ "" ],
										"id" : "obj-42",
										"patching_rect" : [ 117.0, 82.0, 28.0, 23.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "param period 4410 @min 1",
										"fontsize" : 12.0,
										"numinlets" : 0,
										"numoutlets" : 1,
										"fontname" : "Lato",
										"outlettype" : [ "" ],
										"id" : "obj-38",
										"patching_rect" : [ 117.0, 31.0, 156.0, 23.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "comment",
										"text" : "apply to input",
										"fontsize" : 12.0,
										"numinlets" : 1,
										"numoutlets" : 0,
										"fontname" : "Lato",
										"id" : "obj-31",
										"patching_rect" : [ 167.5, 423.0, 83.0, 21.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "out 1",
										"fontsize" : 12.0,
										"numinlets" : 1,
										"numoutlets" : 0,
										"fontname" : "Lato",
										"id" : "obj-24",
										"patching_rect" : [ 117.0, 457.0, 37.0, 23.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "in 1",
										"fontsize" : 12.0,
										"numinlets" : 0,
										"numoutlets" : 1,
										"fontname" : "Lato",
										"outlettype" : [ "" ],
										"id" : "obj-23",
										"patching_rect" : [ 144.0, 379.0, 32.5, 23.0 ]
									}

								}
, 								{
									"box" : 									{
										"maxclass" : "newobj",
										"text" : "*",
										"fontsize" : 12.0,
										"numinlets" : 2,
										"numoutlets" : 1,
										"fontname" : "Lato",
										"outlettype" : [ "" ],
										"id" : "obj-8",
										"patching_rect" : [ 117.0, 423.0, 46.0, 23.0 ]
									}

								}
 ],
							"lines" : [ 								{
									"patchline" : 									{
										"source" : [ "obj-8", 0 ],
										"destination" : [ "obj-24", 0 ]
									}

								}
, 								{
									"patchline" : 									{
										"source" : [ "obj-5", 0 ],
										"destination" : [ "obj-8", 0 ],
										"midpoints" : [ 126.5, 410.0, 126.5, 410.0 ]
									}

								}
, 								{
									"patchline" : 									{
										"source" : [ "obj-42", 0 ],
										"destination" : [ "obj-1", 0 ]
									}

								}
, 								{
									"patchline" : 									{
										"source" : [ "obj-38", 0 ],
										"destination" : [ "obj-42", 0 ]
									}

								}
, 								{
									"patchline" : 									{
										"source" : [ "obj-23", 0 ],
										"destination" : [ "obj-8", 1 ]
									}

								}
, 								{
									"patchline" : 									{
										"source" : [ "obj-2", 0 ],
										"destination" : [ "obj-5", 1 ]
									}

								}
, 								{
									"patchline" : 									{
										"source" : [ "obj-1", 0 ],
										"destination" : [ "obj-5", 0 ]
									}

								}
 ]
						}

					}
,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 106.0, 301.0, 115.0, 22.0 ],
					"text" : "mc.gen~ pulsar-gen",
					"wrapper_uniquekey" : "u723001178"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
