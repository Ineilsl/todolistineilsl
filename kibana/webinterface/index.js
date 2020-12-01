export default function (kibana) {
	return new kibana.Plugin({
	    id: 'webinterface',
	    require: ['kibana', 'elasticsearch'],
	    uiExports: {
	      visTypes: [
	      	'plugins/webinterface/viz'
	      ]
	    }
	})
}
