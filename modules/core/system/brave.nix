{ config, pkgs, lib, ... }:

{
  # Install Brave browser
  environment.systemPackages = with pkgs; [
    brave
  ];


  # ============================================================================
  # PRIVACY GUIDES CONFIGURATION - System-wide policies
  # Based on: https://www.privacyguides.org/en/desktop-browsers/
  # ============================================================================
  
  # Brave policies are enforced through JSON files in /etc/brave/policies/managed/
  # These settings align with Privacy Guides recommendations and cannot be changed by users
  
  environment.etc."brave/policies/managed/privacy-guides.json".text = builtins.toJSON {
    
    # ========================================
    # SHIELDS CONFIGURATION (Privacy Guides)
    # ========================================
    
    # Trackers & ads blocking: Aggressive
    "BraveShieldsEnabledForUrls" = [ "*" ];
    "BraveShieldsMode" = "aggressive";
    
    # Block fingerprinting
    "BraveFingerprintingBlockEnabled" = true;
    
    # Block third-party cookies
    "BlockThirdPartyCookies" = true;
    
    # Upgrade connections to HTTPS: Strict
    "BraveHTTPSEUpgradeEnabled" = true;
    
    # Auto-redirect AMP pages
    "BraveAMPEnabled" = false;
    
    # Auto-redirect tracking URLs
    "BraveDebounceEnabled" = true;
    
    # Prevent sites from fingerprinting based on language preferences
    "BraveReduceLanguageEnabled" = true;
    
    # Automatically remove permissions from unused sites
    "UnusedSitePermissionsRevocationEnabled" = true;
    
    # ========================================
    # PRIVACY AND SECURITY SETTINGS
    # ========================================
    
    # WebRTC IP Handling: Disable non-proxied UDP
    "WebRtcIPHandlingPolicy" = "disable_non_proxied_udp";
    
    # Disable Google services for push messaging
    "BraveGCMChannelStatus" = false;
    
    # Block all social media components
    "BraveFacebookEmbedEnabled" = false;
    "BraveTwitterEmbedEnabled" = false;
    "BraveLinkedInEmbedEnabled" = false;
    
    # Disable JavaScript optimization (V8 optimizer) for security
    "JavaScriptJitSettings" = 2;  # 2 = Disabled
    
    # ========================================
    # DATA COLLECTION - DISABLE ALL
    # ========================================
    
    # Disable privacy-preserving product analytics (P3A)
    "BraveP3AEnabled" = false;
    
    # Disable daily usage ping
    "BraveStatsUsagePingEnabled" = false;
    
    # Disable diagnostic reports
    "MetricsReportingEnabled" = false;
    
    # Disable crash reporting
    "BraveCrashReportsEnabled" = false;
    
    # ========================================
    # WEB3 - DISABLE (reduces fingerprint)
    # ========================================
    
    # Default Ethereum wallet: Extensions (no fallback)
    "BraveWalletEthereumProvider" = 3;  # 3 = Extensions only
    
    # Default Solana wallet: Extensions (no fallback)
    "BraveWalletSolanaProvider" = 3;  # 3 = Extensions only
    
    # ========================================
    # SEARCH ENGINE
    # ========================================
    
    # Disable search suggestions (privacy risk)
    "SearchSuggestEnabled" = false;
    
    # Set DuckDuckGo as default (Privacy Guides recommendation)
    "DefaultSearchProviderEnabled" = true;
    "DefaultSearchProviderName" = "DuckDuckGo";
    "DefaultSearchProviderKeyword" = "ddg";
    "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
    "DefaultSearchProviderSuggestURL" = "";  # Disabled
    
    # ========================================
    # EXTENSIONS & BUILT-IN FEATURES
    # ========================================
    
    # Disable built-in extensions (reduce attack surface)
    "BraveRewardsEnabled" = false;
    "BraveTorEnabled" = false;  # Use Tor Browser for anonymity instead
    "BraveWalletEnabled" = false;
    "BraveNewsEnabled" = false;
    "BraveVPNEnabled" = false;
    "BraveLeoAssistantEnabled" = false;
    "BraveVPNShowButton" = false;
    
    # ========================================
    # ADDITIONAL PRIVACY PROTECTIONS
    # ========================================
    
    # Disable SafeBrowsing (sends data to Google)
    "SafeBrowsingEnabled" = false;
    "SafeBrowsingExtendedReportingEnabled" = false;
    
    # Disable autofill
    "AutofillAddressEnabled" = false;
    "AutofillCreditCardEnabled" = false;
    
    # Disable password manager
    "PasswordManagerEnabled" = false;
    
    # Disable translation
    "TranslateEnabled" = false;
    
    # Disable sync (use Brave Sync manually if needed with E2EE)
    "SyncDisabled" = true;
    "BrowserSignin" = 0;  # Disable sign-in
    
    # Block third-party cookies
    "DefaultCookiesSetting" = 4;  # Block third-party
    
    # Disable geolocation
    "DefaultGeolocationSetting" = 2;  # Block
    
    # Disable notifications by default
    "DefaultNotificationsSetting" = 2;  # Block
    
    # Disable WebBluetooth
    "DefaultWebBluetoothGuardSetting" = 2;  # Block
    
    # Disable WebUSB
    "DefaultWebUsbGuardSetting" = 2;  # Block
    
    # HTTPS-Only Mode in all windows
    "HttpsOnlyMode" = "force_enabled";
    
    # Disable background apps
    "BackgroundModeEnabled" = false;
    
    # Disable DNS prefetch
    "DnsOverHttpsMode" = "off";  # Let system handle DNS (use system-level DoH)
    
    # Disable network prediction
    "NetworkPredictionOptions" = 2;  # Never predict
    
    # Disable spell check (privacy concern)
    "SpellcheckEnabled" = false;
    
    # ========================================
    # SECURITY HARDENING
    # ========================================
    
    # Strict site isolation
    "SitePerProcess" = true;
    
    # Enable strict origin isolation
    "StrictOriginIsolation" = true;
    
    # Disable SSL error overrides
    "SSLErrorOverrideAllowed" = false;
    
    # Disable QUIC protocol
    "QuicAllowed" = false;
    
    # Clear data on exit (optional - uncomment if desired)
    # "ClearBrowsingDataOnExitList" = [ "browsing_history" "download_history" "cookies_and_other_site_data" "cached_images_and_files" ];
  };

  # ============================================================================
  # NOTES AND IMPORTANT INFORMATION
  # ============================================================================
  
  # MANUAL CONFIGURATION REQUIRED:
  # Some settings cannot be enforced via policies and must be configured manually:
  # 
  # 1. In brave://settings/shields:
  #    - Verify "Block Scripts" is checked (optional, breaks many sites)
  #    - Verify "Forget me when I close this site" is checked per-site as needed
  # 
  # 2. In brave://adblock:
  #    - Keep default filter lists ONLY (do not add extra lists)
  #    - Adding extra lists increases fingerprinting risk
  # 
  # 3. Brave Sync:
  #    - If needed, enable manually - it uses E2EE and doesn't require an account
  #    - This config disables it by default for maximum privacy
  # 
  # 4. Per-site exceptions:
  #    - Click the Shield icon in address bar to adjust settings per-site
  #    - You may need to allow cookies/scripts for sites you trust
  
  # PRIVACY GUIDES RECOMMENDATIONS NOT IN THIS CONFIG:
  # - "Block Scripts" is NOT enabled by default (breaks too many sites)
  # - You should enable it per-site as needed via the Shield icon
  
  # WAYLAND SUPPORT (optional):
  # If using Wayland, uncomment the section below
  
  /*
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";  # Enable Wayland for Chromium-based browsers
  };
  */
  
  # ============================================================================
  # OPTIONAL: DNS-OVER-HTTPS AT SYSTEM LEVEL
  # ============================================================================
  
  # Privacy Guides recommends using DNS-over-HTTPS
  # Configure this at the system level instead of browser level
  # Uncomment if you want to use Quad9 DNS-over-HTTPS:
  
  /*
  networking.nameservers = [ "9.9.9.9" "149.112.112.112" ];
  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    domains = [ "~." ];
    fallbackDns = [ "9.9.9.9" "149.112.112.112" ];
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };
  */
  
  # ============================================================================
  # OPTIONAL: ADDITIONAL SYSTEM HARDENING
  # ============================================================================
  
  # Enable AppArmor for additional browser sandboxing
  # security.apparmor.enable = true;
  
  # Enable Chromium SUID sandbox
  # security.chromiumSuidSandbox.enable = true;
}
