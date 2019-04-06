//
//  NewFeedHelper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

/// MARK: - NewFeedService Class
class NewFeedHelper {
    
    // MARK: - Variables
    private var newFeeds: [NewFeed] = []
    private static var instance: NewFeedHelper!
    
    // MARK: - Initialization
    private init() {
        setupData()
    }
    
    static func shared() -> NewFeedHelper {
        if instance == nil {
            return NewFeedHelper()
        }
        return instance
    }
    
    /// - Initializing all power rangers
    private func setupData() {
        newFeeds = []
        
        var newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://httpbin.org/image/jpeg", imageURL: "https://images.pexels.com/photos/264109/pexels-photo-264109.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)
        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)
        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/42839565_1615473415265156_2396284446257971200_n.jpg?_nc_cat=110&_nc_ht=scontent.fkul15-1.fna&oh=bda416a4508be4f9f7b96b6dfc3f50e9&oe=5C65D2DF", title: "Cô Út Họ Châu", detail: "Nhưng sao em không buồn...\nSao không thấy nước mắt em rơi 😊😊\n- Hello October 😘😘", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/34636629_1479003558912143_8472421018311327744_n.jpg?_nc_cat=111&_nc_ht=scontent.fkul15-1.fna&oh=f05c1512167d4b78b6da92cf0dbbe89f&oe=5C84D954", title: "Cô Út Họ Châu", detail: "Gift for my love 🎁 💝", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://httpbin.org/image/jpeg", title: "Thắm Mộc is with Cô Út Họ Châu and 2 others.", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/33833362_833784820139721_6767834346335240192_n.jpg?_nc_cat=104&_nc_ht=scontent.fkul15-1.fna&oh=a892a6b85f816ff5cea00474965df4c1&oe=5C7F382D", title: "Thắm Mộc is with Cô Út Họ Châu and 2 others.", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/39538995_1576945379117960_7673532418078277632_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=885cb3e82ea622cd6ae6cf4858e1ff92&oe=5C892021", title: "Cô Út Họ Châu updated her cover photo.", detail: "Là con gái sẽ hạnh phúc\nKhi tìm thấy đc người....Yêu chân thành dám hy sinh cho mình 😘😘", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/27972655_1391424651003368_561365569091565883_n.jpg?_nc_cat=108&_nc_ht=scontent.fkul15-1.fna&oh=e8516b652090bb82929d29d7ce53f6f3&oe=5C7B9285", title: "Cô Út Họ Châu", detail: "Không ai sinh ra là hiểu nhau liền được, mọi thứ phải theo năm tháng, em và anh cũng đi qua nhiều khó khăn, nhiều sự ngu ngốc, để giờ khi cãi nhau cũng không giống như hồi trẻ trâu nữa thay vào đó là nói nhau cái nào đúng, cái nào sai, cần nên làm gì và không nên làm gì để giữ mối quan hệ của mình...chỉ như vậy thôi..phải ko a ^^", dateTime: "February 20 · Edited")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        
        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

        newFeed = NewFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/41519882_1600898243389340_5938518213502435328_o.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=8aac74284b8f29874552b39376f0f56e&oe=5C8963F1", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newFeeds.append(newFeed)

    }
    
    func getNewFeeds() -> [NewFeed] {
        return newFeeds
    }
}

