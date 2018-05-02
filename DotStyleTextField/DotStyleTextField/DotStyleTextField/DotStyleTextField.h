//
//  DotStyleTextField.h
//  DotStyleTextField
//
//  Created by ChangLuyang on 2018/5/2.
//  Copyright © 2018年 ChangLuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DotStyleTextField;
typedef void(^InputFinishBlock)(DotStyleTextField *textField, NSString *inputText);

@interface DotStyleTextField : UITextField
@property (nonatomic, copy) InputFinishBlock inputFinishHandler;
- (instancetype)initWithFrame:(CGRect)frame;
@end
