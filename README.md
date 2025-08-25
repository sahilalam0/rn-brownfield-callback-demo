# RN Brownfield Callback Demo

This repo shows a minimal brownfield React Native demo where a React Native component calls a native iOS method to generate a random string.

Design choice: this example uses a simple runtime lookup inside the TurboModule to find the host app's `NativeCommunicationService` singleton and call `processEvents()`.

What to expect

- Pressing the button in the RN screen triggers `NativeCommunicationTurboModule.processEvents()`.
- The TurboModule uses `NSClassFromString(@"NativeIOSApp.NativeCommunicationService")` to find the native singleton and call `processEvents`.
- The native method returns a random string which is displayed in the RN UI.

Project layout (key files)

- `src/specs/NativeCommunication.ts` — TurboModule TypeScript spec
- `src/components/ProcessEventsDemo.tsx` — React Native UI
- `ios/NativeCommunicationTurboModule.mm` — TurboModule implementation
- `NativeIOSApp/NativeIOSApp/CommunicationService.swift` — Native host service (singleton with `processEvents()`)

How to run

1. Install JS deps:

```bash
npm install
```

2. Package IOS:

```bash
npm run package:ios
```

3. Run NativeIOSApp to verify

```bash
xed NativeIOSApp
```

Move the generated packages to NativeIOSApp project via xcode and run the app

What to look for in logs

- `📡 [NativeCommunicationTurboModule] TurboModule initialized`
- `🎯 [NativeCommunicationTurboModule] processEvents called`
- `🔍 [NativeCommunicationTurboModule] Service shared instance: YES`
- `✅ [NativeCommunicationTurboModule] Received response from registered service: <random-string>`
