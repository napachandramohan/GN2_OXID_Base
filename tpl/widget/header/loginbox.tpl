[{gn2_oxscript include="js/widgets/oxflyoutbox.js" priority=10 }]
[{gn2_oxscript add="$( '#loginTrigger' ).oxFlyOutBox();"}]

<li class="topPopList login[{if $oxcmp_user->oxuser__oxpassword->value}] logged[{/if}]">
	[{if !$oxcmp_user->oxuser__oxpassword->value}]
	<span id="loginTrigger" class="selectedValue"><a href="#">[{oxmultilang ident="LOGIN"}]</a></span>
	[{else}]
	<span id="loginTrigger" class="selectedValue"><a href="#">[{oxmultilang ident="WIDGET_LOGINBOX_LOGOUT"}]</a></span>
	[{/if}]
	
	<ul class="flyoutBox">
       	<li>
    
	[{assign var="bIsError" value=0 }]
	[{capture name=loginErrors}]
	    [{foreach from=$Errors.loginBoxErrors item=oEr key=key }]
	        <p id="errorBadLogin" class="errorMsg">[{$oEr->getOxMessage()}]</p>
	        [{assign var="bIsError" value=1 }]
	    [{/foreach}]
	[{/capture}]
	
	[{if !$oxcmp_user->oxuser__oxpassword->value}]
	
	    <form id="login" name="login" action="[{$oViewConf->getSslSelfLink() }]" method="post">
	        <div id="loginBox" class="loginBox" [{if $bIsError}]style="display: block;"[{/if}]>
	            [{$oViewConf->getHiddenSid() }]
	            [{$oViewConf->getNavFormParams() }]
	            <input type="hidden" name="fnc" value="login_noredirect">
	            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName() }]">
	            <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
	            <input type="hidden" name="CustomError" value="loginBoxErrors">
	            [{if $oView->getClassName() eq "content"}]
                  <input type="hidden" name="oxcid" value="[{$oView->getContentId() }]">
              [{/if}]
	            [{if $oView->getProduct()}]
	                [{assign var="product" value=$oView->getProduct() }]
	                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value }]">
	            [{/if}]
	            <div class="loginForm">
	                <h4>[{oxmultilang ident="LOGIN"}]</h4>
	                <p>
	                    <label for="loginEmail">[{oxmultilang ident="WIDGET_LOGINBOX_EMAIL_ADDRESS"}]</label>
	                    <input id="loginEmail" type="text" name="lgn_usr" value="" class="textbox">
	                </p>
	                <p>
	                    <label for="loginPassword">[{oxmultilang ident="WIDGET_LOGINBOX_PASSWORD"}]</label>
	                    <input id="loginPassword" type="password" name="lgn_pwd" class="textbox passwordbox" value="">
	                    <a id="forgotPasswordOpener" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]" rel="nofollow">[{oxmultilang ident="FORM_LOGIN_ACCOUNT_FORGOTPWD"}]</a>
	                </p>
	                [{$smarty.capture.loginErrors}]
	                
	                [{if $oView->showRememberMe()}]
	                <p class="checkFields">
	                    <input type="checkbox" class="checkbox" value="1" name="lgn_cook" id="remember"><label for="remember">[{oxmultilang ident="WIDGET_LOGINBOX_REMEMBER_ME"}]</label>
	                </p>
	                [{/if}]
	                
	                <p>
	                    <button type="submit" class="submitButton">[{oxmultilang ident="LOGIN"}]</button>
	                </p>
	            </div>
	            
	            [{if $oViewConf->getShowFbConnect()}]
	                <div class="altLoginBox">
	                    <span>[{oxmultilang ident="WIDGET_LOGINBOX_WITH"}]</span>
	                    <div id="loginboxFbConnect">
                          [{include file="widget/facebook/enable.tpl" source="widget/facebook/connect.tpl" ident="#loginboxFbConnect" }]
                      </div>
	                </div>
	            [{/if}]
	            
	        </div>
	    </form>
	[{else}]
	    [{oxmultilang ident="WIDGET_LOGINBOX_GREETING"}]
	    [{assign var="fullname" value=$oxcmp_user->oxuser__oxfname->value|cat:" "|cat:$oxcmp_user->oxuser__oxlname->value }]
	    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
	    [{if $fullname}]
	        [{$fullname}]
	    [{else}]
	        [{$oxcmp_user->oxuser__oxusername->value|oxtruncate:25:"...":true }]
	    [{/if}]
	    </a>
	    <a id="logoutLink" class="logoutLink" href="[{$oViewConf->getLogoutLink() }]" title="[{oxmultilang ident="WIDGET_LOGINBOX_LOGOUT"}]">[{oxmultilang ident="WIDGET_LOGINBOX_LOGOUT"}]</a>
	[{/if}]


	</ul>
</li>