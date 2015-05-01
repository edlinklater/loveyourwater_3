<?php
/**
 * Required because Member->logOut() blows away the whole session,
 * including all state we're relying on for testsession.
 * Restores non-login related session state after logout.
 */
class LywTestSessionMemberExtension extends DataExtension {

	protected $_cache_session;

	function beforeMemberLoggedOut() {
		if(SiteConfig::current_site_config()->IsRunningTests()) {
			$this->_cache_session = Session::get_all();
		}
	}

	function memberLoggedOut() {
		if($this->_cache_session) {
			$restoreStates = array_diff_key(
				$this->_cache_session,
				array('loggedInAs' => true)
			);
			foreach($restoreStates as $k => $v) {
				Session::set($k, $v);
			}
			Session::save();
		}
	}
}