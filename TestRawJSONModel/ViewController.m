//
//  ViewController.m
//  TestRawJSONModel
//
//  Created by jianjun on 2020-02-06.
//  Copyright © 2020 Jianjun. All rights reserved.
//

#import "ViewController.h"

#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "MakaMTLJSONAdapter.h"


@interface RawPropModel : MTLModel <MTLJSONSerializing, MakaMTLModelRawJSONProp>
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *width;
@property (nonatomic, copy) NSDictionary *unknow_raw_json;

@property (nonatomic, strong) NSDictionary *makaMTLModelRawJSONProp;
@end

@implementation RawPropModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"type": @"type",
        @"name": @"name"
    };
}


- (BOOL)supportRawJSONProp {
    return YES;
}

@end


@interface RawJSONPropMTLModel : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy) NSString *element_id;
@property (nonatomic, copy) RawPropModel *element;
@end

@implementation RawJSONPropMTLModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"element_id": @"element_id",
        @"element": @"element"
    };
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *jsonDict = @{
        @"element_id": @"abcd",
        @"element": @{
                @"type": @"video",
                @"unknow_prop": @"abcde",
        }
    };
    RawJSONPropMTLModel *model = [MakaMTLJSONAdapter modelOfClass:RawJSONPropMTLModel.class fromJSONDictionary:jsonDict error:NULL];
    NSLog(@"a model %@", model);
    
    NSDictionary *dict = [MakaMTLJSONAdapter JSONDictionaryFromModel:model error:NULL];
 
    NSLog(@"dict from model %@", dict);

}


@end
