//
//  DotStyleTextField.m
//  DotStyleTextField
//
//  Created by ChangLuyang on 2018/5/2.
//  Copyright © 2018年 ChangLuyang. All rights reserved.
//

#import "DotStyleTextField.h"

@interface DotStyleTextField()

/**
 存放小圆点的数组
 */
@property (nonatomic, strong) NSMutableArray *dots;
@end

@implementation DotStyleTextField
- (instancetype)initWithFrame:(CGRect)frame {
    // 四个数字的
    frame = CGRectMake(frame.origin.x, frame.origin.y, 265, 70);
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (NSMutableArray *)dots {
    if (!_dots) {
        _dots = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return _dots;
}

- (void)initUI {
    // 输入键盘为数字键盘
    self.keyboardType = UIKeyboardTypeNumberPad;
    
    // 隐藏输入的光标
    self.tintColor = [UIColor clearColor];
    
    // 隐藏输入的文字
    self.textColor = [UIColor clearColor];
    
    // 四个方框和圆点
    for (int i = 0; i < 4; i++) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(13 * (i + 1) + 50 * i, 10, 50, 50);
        layer.borderColor = [[UIColor colorWithRed:212 / 255.0f green:212 / 255.0f blue:212 / 255.0f alpha:1] CGColor];
        layer.borderWidth = 1;
        [self.layer addSublayer:layer];
        
        CALayer *dot = [CALayer layer];
        dot.frame = CGRectMake(13 * (i + 1) + 50 * i + 25 - 6, 70 / 2 - 6, 12, 12);
        dot.backgroundColor = [[UIColor blackColor] CGColor];
        dot.cornerRadius = 6;
        dot.hidden = YES;
        [self.dots addObject:dot];
        [self.layer addSublayer:dot];
    }
    [self addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
}


// 屏蔽掉自带的菜单了
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO;
}

- (void)showDots:(NSInteger)length {
    for (NSInteger index = 0; index < 4; index++) {
        CALayer *dot = [self.dots objectAtIndex:index];
        if (index < length) {
            dot.hidden = NO;
        } else {
            dot.hidden = YES;
        }
    }
}

- (void)textChanged:(UITextField *)textField {
    NSString *content = textField.text;
    if (content.length > 4) {
        content = [content substringToIndex:4];
        textField.text = content;
    }
    
    [self showDots:textField.text.length];
    
    // 达到输入长度,回调
    if (textField.text.length == 4) {
        if (self.inputFinishHandler) {
            self.inputFinishHandler(self, textField.text);
        }
    }
}

@end
