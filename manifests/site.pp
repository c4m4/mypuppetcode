import 'classes/*.pp'
import 'nodes/*.pp'

node default {
	include sshcon, motdclass
}
