//
//  MakaMTLJSONAdapter.h
//  TestRawJSONModel
//
//  Created by jianjun on 2020-02-06.
//  Copyright © 2020 Jianjun. All rights reserved.
//

#import "MTLJSONAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MakaMTLModelRawJSONProp <NSObject>

- (void)setMakaMTLModelRawJSONProp:(NSDictionary *)rawJSON;

- (NSDictionary *)makaMTLModelRawJSONProp;

@end

@interface MakaMTLJSONAdapter : MTLJSONAdapter

@end

NS_ASSUME_NONNULL_END
