'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "character.jpeg": "e71153417dd61cf2c5f702903389d320",
"ms-icon-150x150.png": "e9a6d68a55f5b2dd70a4641341ac4557",
"Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"ms-icon-310x310.png": "b4893f7d4f790a121d1fe9f2156db542",
"browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"favicon.png": "6d6b7dc9e73a399fed0ed32079a466fb",
"main.dart.js": "57c12323ad83392a3628939076d62dd2",
"favicon-96x96.png": "2a0f3687a42ea85f895a38df06643d40",
"apple-icon-60x60.png": "6162fa13964742cfc9e3238cad6c9724",
"apple-icon-144x144.png": "a80ace4513b322a2ae948b9d5e70323b",
"android-icon-36x36.png": "5eebbe971ee4881762dd6bbfb43c3dac",
"apple-icon-152x152.png": "058d2b0ac08c49b3890942b2273eb33a",
"android-icon-48x48.png": "e37ef811aa94edc408ee4f6c051e2695",
"favicon-16x16.png": "2c5d6edd03cc882d0ce040cbb4b463ab",
"Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.ico": "6d6b7dc9e73a399fed0ed32079a466fb",
"index.html": "0f9d981f2b19c57f46e9d9af1882e095",
"/": "0f9d981f2b19c57f46e9d9af1882e095",
"ms-icon-144x144.png": "a80ace4513b322a2ae948b9d5e70323b",
"apple-icon.png": "44f3fe8bdf7b6c31193a0190b10067b8",
"android-icon-144x144.png": "a80ace4513b322a2ae948b9d5e70323b",
"apple-icon-180x180.png": "5a3d9a448b0e4df38f4db023cf7b2e96",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"apple-icon-72x72.png": "d8ea92ef36cfad933e81e1560b3126f4",
"manifest.json": "a83bbbd9d23ea4d752fbcd44cdc544fa",
"apple-icon-114x114.png": "3b07299d8756127ae08792ff2cd93b8a",
"favicon-32x32.png": "33c38ff8737ae7acdff140ad9f883e6f",
"apple-icon-57x57.png": "2285ac5a325be7fbd773bf2b735c48ee",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"android-icon-96x96.png": "2a0f3687a42ea85f895a38df06643d40",
"assets/AssetManifest.json": "729e78a063aecb870618523b49b3cb0c",
"assets/shaders/ink_sparkle.frag": "237ceacd6c04871e538aaa934b1327a3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/FontManifest.json": "5ba067f4f8061325207f0222f997d8f7",
"assets/assets/github2.png": "dda4ed64a67ac5d80e8eac27dfbe677e",
"assets/assets/firebase.png": "1da029b3c1a275f00a75e7bb3ab8d9db",
"assets/assets/haum1.png": "df7d9fa1b436227c80e852372a702e0f",
"assets/assets/address.jpg": "236393a7633dadb2c0c8724e5d4431af",
"assets/assets/haum3.png": "5612a3a9c72674edb3a211409cabdf64",
"assets/assets/github.png": "b6b2a07ff2298ea2f158ed45b4ed0bad",
"assets/assets/blog.png": "5ad30357f962c6b53b70be654c1c1c2b",
"assets/assets/flutter.png": "f0ecf5b601b1c99977082ec847b75dce",
"assets/assets/mariadb.png": "e557fa01650f3aadeb7bb3b960770ed0",
"assets/assets/me.png": "dc9e800fa00381073fed0b56bf664ea8",
"assets/assets/email.jpg": "89d9adcb8de4f0992a31b7c7129a13a6",
"assets/assets/phone.png": "d510c485c5142a6d385972ced4fe8967",
"assets/assets/skill.png": "f2e3ce14853122bcf3c92b35c93a80a7",
"assets/assets/email.png": "6fd7e0a88b3cffa15895fa3c9574f4a0",
"assets/assets/haum2.png": "c899389659d551464ebbcd6e26b166e0",
"assets/fonts/Jalnan.ttf": "6be3d80cc02d977f57c6dacced006461",
"assets/fonts/JejuMyeongjo.ttf": "69a12af9f4655d3d4bd272c53c10d0cc",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/Museum.ttf": "119c6f5fedb0f35134563141f36adf39",
"assets/NOTICES": "48de35a6040031cf37b6bb2c6b076d41",
"apple-icon-76x76.png": "8f6ecca1b8ff0b5b3d2f4cd55a5935a8",
"version.json": "009c9e65172e010890f7f65fde438006",
"android-icon-192x192.png": "baecb1e3a4e63a404b78646dc4c564f7",
"android-icon-72x72.png": "d8ea92ef36cfad933e81e1560b3126f4",
"apple-icon-120x120.png": "982c98c569e20537bf889e4d46c6a285",
"apple-icon-precomposed.png": "44f3fe8bdf7b6c31193a0190b10067b8",
"ms-icon-70x70.png": "d55abf4a2d1bdce7f7110f3d3cfae807"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
