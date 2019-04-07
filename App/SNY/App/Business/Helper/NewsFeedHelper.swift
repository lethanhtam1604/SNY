//
//  NewsFeedHelper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

/// MARK: - NewsFeedService Class
class NewsFeedHelper {
    
    // MARK: - Variables
    private var newsFeeds: [NewsFeed] = []
    private static var instance: NewsFeedHelper!
    
    // MARK: - Initialization
    private init() {
        setupData()
    }
    
    static func shared() -> NewsFeedHelper {
        if instance == nil {
            return NewsFeedHelper()
        }
        return instance
    }
    
    /// - Initializing all power rangers
    private func setupData() {
        newsFeeds = []
        
        var photo = NewsFeedPhoto(imageURL: "https://images.pexels.com/photos/264109/pexels-photo-264109.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", width: 837, height: 583)
        var newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://httpbin.org/image/jpeg", photo: photo, title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newsFeeds.append(newsFeed)
        
        photo = NewsFeedPhoto(imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/39538995_1576945379117960_7673532418078277632_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=170ded39400368dec13b5b5d2646d7d8&oe=5D4EE121", width: 837, height: 558)
        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", photo: photo, title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
        newsFeeds.append(newsFeed)
        
        photo = NewsFeedPhoto(imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", width: 751, height: 751)
        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", photo: photo, title: "Cô Út Họ Châu", detail: "Nhưng sao em không buồn...\nSao không thấy nước mắt em rơi 😊😊\n- Hello October 😘😘", dateTime: "September 12 2018")
        newsFeeds.append(newsFeed)

        photo = NewsFeedPhoto(imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/54211723_1567129976764208_8653756474578698240_n.jpg?_nc_cat=101&_nc_ht=scontent.fkul15-1.fna&oh=a27b102c218be52888fa4ac3cf7dcbd1&oe=5D4A9D43", width: 837, height: 558)
        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", photo: photo, title: "Cô Út Họ Châu", detail: "Gift for my love 🎁 💝", dateTime: "September 12 2018")
        newsFeeds.append(newsFeed)

        photo = NewsFeedPhoto(imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/50471971_1716143105198186_8525665306973044736_n.jpg?_nc_cat=104&_nc_ht=scontent.fkul15-1.fna&oh=54adc18204bb9fd8dc4e235d358b1f95&oe=5D0ABF59", width: 837, height: 558)
        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", photo: photo, title: "Thắm Mộc is with Cô Út Họ Châu and 2 others.", detail: "CHỈ CẦN GẶP ĐÚNG NGƯỜI, MỌI SỰ CHỜ ĐỢI ĐỀU THẬT SỰ ĐÁNG GIÁ. Có người dành cả đời mình chỉ để tìm kiếm một tình yêu đích thực. Có người chỉ mới quen vài ba câu đã vội vã yêu nhau. Tình yêu vốn dĩ là một thứ tình cảm kì lạ của con người, vừa lung linh vừa khó đoán. Có bao giờ em thắc mắc định mệnh thật ra là gì không? Người ta hay bảo gặp được nhau là chữ duyên, đi cùng nhau lại là cố gắng. Cũng không ít người bảo đó là nợ, vì kiếp trước chưa trả hết cho nhau nên bây giờ phải trả. Em biết không, mỗi người đi qua cuộc đời của mình đều có ý nghĩa cả. Việc của em là chấp nhận và đối mặt với nó, như con nhộng phải tự mình chui ra khỏi cái kén để có thể trở thành một chú bướm xinh đẹp vậy", dateTime: "September 12 2018")
        newsFeeds.append(newsFeed)


//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Thắm Mộc is with Cô Út Họ Châu and 2 others.", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu updated her cover photo.", detail: "Là con gái sẽ hạnh phúc\nKhi tìm thấy đc người....Yêu chân thành dám hy sinh cho mình 😘😘", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Không ai sinh ra là hiểu nhau liền được, mọi thứ phải theo năm tháng, em và anh cũng đi qua nhiều khó khăn, nhiều sự ngu ngốc, để giờ khi cãi nhau cũng không giống như hồi trẻ trâu nữa thay vào đó là nói nhau cái nào đúng, cái nào sai, cần nên làm gì và không nên làm gì để giữ mối quan hệ của mình...chỉ như vậy thôi..phải ko a ^^", dateTime: "February 20 · Edited")
//        newsFeeds.append(newsFeed)
//
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)
//
//        newsFeed = NewsFeed.init(id: 1, thumbnailUrl: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-1/p320x320/49712287_1703509693128194_5953729819433762816_n.jpg?_nc_cat=102&_nc_ht=scontent.fkul15-1.fna&oh=f16083983106208e2881ef4f3370f625&oe=5D4B4F28", imageURL: "https://scontent.fkul15-1.fna.fbcdn.net/v/t1.0-9/38878133_1389269671216907_2499063151090204672_n.jpg?_nc_cat=100&_nc_ht=scontent.fkul15-1.fna&oh=d313f7574a2aec42f8df3b7f8fe47ede&oe=5D09BCEC", title: "Cô Út Họ Châu", detail: "Đối với thế giới,bạn chỉ là một người..\nNhưng đối với một ai đó,bạn chính là cả thế giới ", dateTime: "September 12 2018")
//        newsFeeds.append(newsFeed)

    }
    
    func getNewsFeeds() -> [NewsFeed] {
        return newsFeeds
    }
}

