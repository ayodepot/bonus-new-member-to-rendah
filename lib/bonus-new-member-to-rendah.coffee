BonusNewMemberToRendahView = require './bonus-new-member-to-rendah-view'
{CompositeDisposable} = require 'atom'

module.exports = BonusNewMemberToRendah =
  bonusNewMemberToRendahView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @bonusNewMemberToRendahView = new BonusNewMemberToRendahView(state.bonusNewMemberToRendahViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @bonusNewMemberToRendahView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'bonus-new-member-to-rendah:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @bonusNewMemberToRendahView.destroy()

  serialize: ->
    bonusNewMemberToRendahViewState: @bonusNewMemberToRendahView.serialize()

  toggle: ->
    console.log 'BonusNewMemberToRendah was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
