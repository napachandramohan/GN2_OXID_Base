[{capture append="oxidBlock_content"}]
    <div class="accountLoginView">
        <h2 class="pageHead">[{oxmultilang ident="PAGE_ACCOUNT_INC_LOGIN_LOGIN"}]</h2>
        [{if $oView->confirmTerms()}]
            [{include file="form/privatesales/accept_terms.tpl"}]
        [{else}]
            [{include file="widget/header/languages.tpl"}]
            <p>[{oxmultilang ident="PAGE_ACCOUNT_INC_LOGIN_ALREADYCUSTOMER"}]</p>
            [{include file="form/login_account.tpl"}]
        [{/if }]
    </div>
[{/capture}]
[{include file="layout/popup.tpl"}]