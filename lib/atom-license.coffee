module.exports =
  activate: ->
    atom.commands.add "atom-workspace", "license:Apache-2.0", => @apache2()
    atom.commands.add "atom-workspace", "license:MIT", => @mit()
    atom.commands.add "atom-workspace", "license:BSD", => @bsd()
    atom.commands.add "atom-workspace", "license:Artistic-2.0", => @artist2()
    atom.commands.add "atom-workspace", "license:GPL-v2", => @gplv2()
    atom.commands.add "atom-workspace", "license:GPL-v3", => @gplv3()
    atom.commands.add "atom-workspace", "license:LGPL-v2.1", => @lgplv21()
    atom.commands.add "atom-workspace", "license:LGPL-v3", => @lgplv3()
    atom.commands.add "atom-workspace", "license:Mozilla", => @mozilla()
    atom.commands.add "atom-workspace", "license:The-Unlicense", => @unlicense()

  mit: ->
    @addLicense("mit")

  bsd: ->
    @addLicense("bsd2")

  apache2: ->
    @addLicense("apache20")

  artist2: ->
    @addLicense("artistic20")

  gplv2: ->
    @addLicense("gplv2")

  gplv3: ->
    @addLicense("gplv3")

  lgplv21: ->
    @addLicense("lgplv21")

  lgplv3: ->
    @addLicense("lgplv3")

  mozilla: ->
    @addLicense("mozilla")

  unlicense: ->
    @addLicense("unlicense")

  addLicense: (name) ->
    editor = atom.workspace.getActivePaneItem()
    @getLicenseText name, (err, license)->
      editor.insertText(license)

  getLicenseText: (name, next) ->
    fs = require "fs"
    file = __dirname + '/licenses/' + name + ".txt"
    fs.readFile file, 'utf8', next
