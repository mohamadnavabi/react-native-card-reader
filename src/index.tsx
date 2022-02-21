import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
  NativeModules,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-card-reader' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

type CardReaderProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'NativeReaderView';

export const CardReaderView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<CardReaderProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };


// export * from './NativeReaderView';

// type NativeReaderType = {
//   multiply(a: number, b: number): Promise<number>;
// }

// export const { NativeReader } = NativeModules;