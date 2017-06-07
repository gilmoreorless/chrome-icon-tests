var mode = 0; // 0: Off; 1: Badge number; 2: Badge X

chrome.browserAction.onClicked.addListener(function (tab) {
    mode = (mode + 1) % 3;
    switch (mode) {
        case 0:
            chrome.browserAction.setBadgeText({text: ''});
            break;
        case 1:
            chrome.browserAction.setBadgeBackgroundColor({color: 'hsl(126, 93%, 33%)'});
            chrome.browserAction.setBadgeText({text: '42'});
            break;
        case 2:
            chrome.browserAction.setBadgeBackgroundColor({color: 'hsl(16, 83%, 43%)'});
            chrome.browserAction.setBadgeText({text: 'x'});
            break;
    }
});
