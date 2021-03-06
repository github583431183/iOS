//
//  main.m
//  _06_多个对象的内存管理练习
//
//  Created by 吴佳臻 on 2017/11/25.
//  Copyright © 2017年 吴佳臻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"
int main(int argc, const char * argv[]) {
    
    /*
     模拟场景：
     1.老王在2010-1-1 17：56：34注册了一个账号
        （名称：xiaomage@520it.com， 密码：haomage）
     2.老王的生日是1986-3-8 18：18：18
     3.老王发布一条说说
        1.文字内容  @“爆米花手机比逼格更有逼格”
        2.图片 @“phone.png”
        3.发表时间: 2015-6-20 10：23：23
        4.作者: 老王
        5.被转发的说说: 没有
        6.评论数: 100
        7.转发数: 90
        8.点赞数: 200
     ----------------------------------
     1.王大锤在2012-8-8 19：26：54注册了一个账号
        （名称：dachuimeimei@520it.com， 密码：654321）
     2.王大锤的生日是1989-9-6 14：16：28
     3.王大锤在2015-6-21 20：47：09时，转发了老王之前发布的说说， 并且还附带了一句话：@“真的很有逼格”
     ----------------------------
     分析：
     1.至少应该有三个类：
        1.账号类(Account):
            1.注册的时间(registerTime)
            2.账号(email)
            3.密码(pwd)
        2.用户类(Author):
            1.用户昵称(name)
            2.用户头像(icon)
            3.用户是否是会员(vip)
            4.用户对应的账号(account)
            5.用户的生日(birthday)
        3.微博类(Status):
            1.微博正文(text)
            2.微博配图(picture)
            3.微博发布的时间(createTime)
            4.微博对应的作者(用户)(author)
            5.评论数(commentCount)
            6.转发数(retweetCount)
            7.赞数(likeCount)
            8.转发微博(repostStatus)
        4.微博中有用户, 用户中有账号
            1.账号
            2.用户
            3.微博
     */
    
    //1.给老王创建账号
    Account *lwAccount = [[Account alloc] init];
    lwAccount.email = @"xiaomage@520it.com";
    lwAccount.pwd = @"haomage";
    lwAccount.registerTime = (MyDate){2010, 1, 1, 17, 56, 34};
    
    //2.根据账号设置用户信息
    Author *lwAuthor = [[Author alloc] init];
    lwAuthor.name = @"老王";
    lwAuthor.icon = @"lw.png";
    lwAuthor.vip = YES;
    lwAuthor.account = lwAccount;
    lwAuthor.birthday = (MyDate){1986, 3, 8, 18, 18, 18};
    
    // 3.发布微博
    Status *lwStatus = [[Status alloc] init];
    lwStatus.text = @"爆米花手机比逼格更有逼格";
    lwStatus.picture = @"phone.png";
    lwStatus.createTime = (MyDate){2015, 6, 20, 10, 23, 23};
    lwStatus.author = lwAuthor;
    lwStatus.commentCount = 100;
    lwStatus.retweetCount = 90;
    lwStatus.likeCount = 200;
    
    // 1.给王大锤创建账号
    Account *dcAccount = [[Account alloc] init];
    dcAccount.email = @"dachuimeimei@520it.com";
    dcAccount.pwd = @"654321";
    dcAccount.registerTime = (MyDate){2012, 8, 8, 19, 26, 54};
    
    // 2.根据账号设置用户信息
    Author *dcAuthor = [[Author alloc] init];
    dcAuthor.name = @"王大锤";
    dcAuthor.icon = @"wdc.png";
    dcAuthor.vip = NO;
    dcAuthor.account = dcAccount;
    dcAuthor.birthday = (MyDate){1989, 9, 6, 14, 16, 28};
    
    // 3.发布微博
    Status *dcStatus = [[Status alloc] init];
    dcStatus.text = @"真的很有逼格";
    dcStatus.picture = nil;
    dcStatus.createTime = (MyDate){2015, 6, 21, 20, 47, 9};
    dcStatus.author = dcAuthor;
    dcStatus.commentCount = 0;
    dcStatus.retweetCount = 0;
    dcStatus.likeCount = 0;
    dcStatus.repostStatus = lwStatus;
    
    // 4.释放资源
    [lwAccount release];
    [lwAuthor release];
    [lwStatus release];
    
    [dcAccount release];
    [dcAuthor release];
    [dcStatus release];
    return 0;
}
