//
//  MakaMTLJSONAdapter.m
//  TestRawJSONModel
//
//  Created by jianjun on 2020-02-06.
//  Copyright © 2020 Jianjun. All rights reserved.
//

#import "MakaMTLJSONAdapter.h"

@implementation MakaMTLJSONAdapter

- (id)modelFromJSONDictionary:(NSDictionary *)JSONDictionary error:(NSError **)error
{
    id model = [super modelFromJSONDictionary:JSONDictionary error:error];
    if ([model conformsToProtocol:@protocol(MakaMTLModelRawJSONProp)]
        && [model supportRawJSONProp]) {
        [model setMakaMTLModelRawJSONProp:JSONDictionary];
    }
    return model;
}

- (NSDictionary *)JSONDictionaryFromModel:(id<MTLJSONSerializing>)model error:(NSError **)error
{
    NSDictionary *dict = [super JSONDictionaryFromModel:model error:error];
    if ([(id)model conformsToProtocol:@protocol(MakaMTLModelRawJSONProp)]
        && [(id)model supportRawJSONProp]) {
        NSDictionary *rawDict = [(id)model makaMTLModelRawJSONProp];
        if (rawDict) {
            NSMutableDictionary *dictWithRawJSON = [rawDict mutableCopy];
            [dictWithRawJSON addEntriesFromDictionary:dict];
            dict = dictWithRawJSON;
        }
    }
    return dict;
}


@end
