[{if $oViewConf->getFbAppId()}]
    <div id="fb-root"></div>
    [{gn2_oxscript include="js/widgets/oxmodalpopup.js"}]
    [{gn2_oxscript include="js/widgets/oxfacebook.js"}]
    [{if $oView->isActive('FacebookConfirm') && !$oView->isFbWidgetVisible()}]
        <div id="fbinfo" class="fbInfoPopup popupBox corners FXgradGreyLight glowShadow">
            <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
            <div class="wrappingIntro clear">
                <h3>[{oxmultilang ident="FACEBOOK_ENABLE_INFOTEXTHEADER"}]</h3>
                [{oxmultilang ident="FACEBOOK_ENABLE_INFOTEXT"}]
            </div>
        </div>
        [{capture name="facebookInit"}]
            [{gn2_oxscript include="js/libs/cookie/jquery.cookie.js"}]
            [{assign var="sFbAppId" value=$oViewConf->getFbAppId()}]
            [{assign var="sLocale" value="FACEBOOK_LOCALE"|oxmultilangassign}]
            [{assign var="sLoginUrl" value=$oView->getLink()|oxaddparams:"fblogin=1"}]
            [{assign var="sLogoutUrl" value=$oViewConf->getLogoutLink()}]
            [{gn2_oxscript add="$('.oxfbenable').click( function() { oxFacebook.showFbWidgets('`$sFbAppId`','`$sLocale`','`$sLoginUrl`','`$sLogoutUrl`'); return false;});"}]
            [{gn2_oxscript add="$('.oxfbinfo').oxModalPopup({ target: '#fbinfo',width: '490px'});"}]
        [{/capture}]
    [{else}]
        [{capture name="facebookInit"}]
            oxFacebook.fbInit("[{$oViewConf->getFbAppId()}]", "[{oxmultilang ident="FACEBOOK_LOCALE"}]", "[{$oView->getLink()|oxaddparams:"fblogin=1"}]", "[{$oViewConf->getLogoutLink()}]");
        [{/capture}]
    [{/if}]
    [{gn2_oxscript add="`$smarty.capture.facebookInit`"}]
[{/if}]