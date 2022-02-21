import React from 'react';
import { requireNativeComponent, ViewProps } from 'react-native';

export const ReaderViewRaw = requireNativeComponent<{}>('NativeReaderView');

export const ReaderView: React.FC<ViewProps> = (props: any) => {
    return <ReaderViewRaw {...props} />
}