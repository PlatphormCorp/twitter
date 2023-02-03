require 'helper'

describe Twitter::Streaming::Event do
  describe '#initialize' do
    before(:each) do
      @data = {event: 'follow', source: {id: 10_083_602, id_str: '10083602', name: 'Adam Bird', screen_name: 'adambird', location: 'Nottingham, UK', url: 'http://t.co/M1eaIKDQyz', description: 'CEO @onediaryapp, ex @esendex CTO and co-founder, still cycling', protected: false, followers_count: 1295, friends_count: 850, listed_count: 53, created_at: 'Fri Nov 09 00:35:12 +0000 2007', favourites_count: 93, utc_offset: 0, time_zone: 'London', geo_enabled: true, verified: false, statuses_count: 13_507, lang: 'en', contributors_enabled: false, is_translator: false, profile_background_color: 'C0DEED', profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_bacground_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', profile_background_tile: false, profile_image_url: 'http://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_image_url_https: 'https://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_link_color: '0084B4', profile_sidebar_border_color: 'C0DEED', profile_sidebar_fill_color: 'DDEEF6', profile_text_color: '333333', profile_use_background_image: true, default_profile: true, default_profile_image: false, following: false, follow_request_sent: false, notifications: false}, target: {id: 1_292_911_088, id_str: '1292911088', name: 'One Diary Bot', screen_name: 'onediarybot', location: nil, url: 'http://t.co/etHGc0xHX4', description: "I'm the One Diary bot, here to help you with your life including personal cycling weather forecasts.", protected: false, followers_count: 123, friends_count: 157, listed_count: 1, created_at: 'Sat Mar 23 23:52:18 +0000 2013', favourites_count: 0, utc_offset: nil, time_zone: nil, geo_enabled: false, verified: false, statuses_count: 9637, lang: 'en', contributors_enabled: false, is_translator: false, profile_background_color: 'C0DEED', profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', profile_background_tile: false, profile_image_url: 'http://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', profile_image_url_https: 'https://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', profile_link_color: '0084B4', profile_sidebar_border_color: 'C0DEED', profile_sidebar_fill_color: 'DDEEF6', profile_text_color: '333333', profile_use_background_image: true, default_profile: true, default_profile_image: false, following: false, follow_request_sent: false, notifications: false}, created_at: 'Sun Oct 27 20:44:19 +0000 2013'}
    end

    subject do
      described_class.new(@data)
    end
    it 'sets the name to be a symbolised version of string string' do
      expect(subject.name).to eq(:follow)
    end

    it 'sets the source to be the User' do
      expect(subject.source).to be_a(Twitter::User)
      expect(subject.source.id).to eq(10_083_602)
    end

    it 'sets the target to be the User' do
      expect(subject.target).to be_a(Twitter::User)
      expect(subject.target.id).to eq(1_292_911_088)
    end

    context 'when target object is a list' do
      before(:each) do
        @data = {event: 'list_member_added', target_object: {full_name: '@adambird/lists/dev', user: {default_profile_image: false, profile_text_color: '333333', created_at: 'Fri Nov 09 00:35:12 +0000 2007', is_translator: false, name: 'Adam Bird', screen_name: 'adambird', geo_enabled: true, follow_request_sent: false, profile_sidebar_border_color: 'C0DEED', default_profile: true, id: 10_083_602, contributors_enabled: false, followers_count: 1295, lang: 'en', profile_background_tile: false, url: 'http://about.me/adambird', profile_sidebar_fill_color: 'DDEEF6', listed_count: 53, utc_offset: 0, location: 'Nottingham, UK', time_zone: 'London', profile_background_color: 'C0DEED', following: false, protected: false, description: 'CEO @onediaryapp, ex @esendex CTO and co-founder, still cycling', profile_image_url_https: 'https://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_link_color: '0084B4', notifications: false, profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', favourites_count: 93, id_str: '10083602', statuses_count: 13_507, verified: false, profile_image_url: 'http://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_use_background_image: true, friends_count: 851}, uri: '/adambird/lists/dev', subscriber_count: 0, id_str: '60314359', created_at: 'Sun Dec 04 19:54:20 +0000 2011', id: 60_314_359, following: false, mode: 'public', member_count: 13, description: '', slug: 'dev', name: 'dev'}, source: {default_profile_image: false, profile_text_color: '333333', created_at: 'Fri Nov 09 00:35:12 +0000 2007', is_translator: false, name: 'Adam Bird', screen_name: 'adambird', geo_enabled: true, follow_request_sent: false, profile_sidebar_border_color: 'C0DEED', default_profile: true, id: 10_083_602, contributors_enabled: false, followers_count: 1295, lang: 'en', profile_background_tile: false, url: 'http://about.me/adambird', profile_sidebar_fill_color: 'DDEEF6', listed_count: 53, utc_offset: 0, location: 'Nottingham, UK', time_zone: 'London', profile_background_color: 'C0DEED', following: false, protected: false, description: 'CEO @onediaryapp, ex @esendex CTO and co-founder, still cycling', profile_image_url_https: 'https://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_link_color: '0084B4', notifications: false, profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', favourites_count: 93, id_str: '10083602', statuses_count: 13_507, verified: false, profile_image_url: 'http://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_use_background_image: true, friends_count: 851}, created_at: 'Sun Oct 27 20:54:51 +0000 2013', target: {default_profile_image: false, profile_text_color: '333333', created_at: 'Sat Mar 23 23:52:18 +0000 2013', is_translator: false, name: 'One Diary Bot', screen_name: 'onediarybot', geo_enabled: false, follow_request_sent: false, profile_sidebar_border_color: 'C0DEED', default_profile: true, id: 1_292_911_088, contributors_enabled: false, followers_count: 124, lang: 'en', profile_background_tile: false, url: 'http://www.onediary.com', profile_sidebar_fill_color: 'DDEEF6', listed_count: 2, utc_offset: nil, location: nil, time_zone: nil, profile_background_color: 'C0DEED', following: true, protected: false, description: "I'm the One Diary bot, here to help you with your life including personal cycling weather forecasts.", profile_image_url_https: 'https://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_link_color: '0084B4', notifications: false, profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', favourites_count: 0, id_str: '1292911088', statuses_count: 9637, verified: false, profile_image_url: 'http://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', profile_use_background_image: true, friends_count: 157}}
      end

      it 'has the list object as the target object' do
        expect(subject.target_object).to be_a(Twitter::List)
        expect(subject.target_object.full_name).to eq('@adambird/lists/dev')
      end
    end

    context 'when target object is a tweet' do
      before(:each) do
        @data = {event: 'favorite', target_object: {in_reply_to_status_id: 394_341_960_603_172_864, favorited: true, entities: {hashtags: [], urls: [], user_mentions: [{screen_name: 'darrenliddell', id_str: '18845675', id: 18_845_675, indices: [0, 14], name: 'Darren Liddell'}]}, user: {default_profile_image: false, profile_text_color: '333333', created_at: 'Sat Mar 23 23:52:18 +0000 2013', is_translator: false, name: 'One Diary Bot', screen_name: 'onediarybot', geo_enabled: false, follow_request_sent: false, profile_sidebar_border_color: 'C0DEED', default_profile: true, id: 1_292_911_088, contributors_enabled: false, followers_count: 124, lang: 'en', profile_background_tile: false, url: 'http://www.onediary.com', profile_sidebar_fill_color: 'DDEEF6', listed_count: 1, utc_offset: nil, location: nil, time_zone: nil, profile_background_color: 'C0DEED', following: true, protected: false, description: "I'm the One Diary bot, here to help you with your life including personal cycling weather forecasts.", profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_link_color: '0084B4', notifications: false, profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', favourites_count: 0, id_str: '1292911088', statuses_count: 9637, verified: false, profile_image_url: 'http://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', profile_use_background_image: true, profile_image_url_https: 'https://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', friends_count: 157}, in_reply_to_screen_name: 'darrenliddell', place: nil, coordinates: nil, id_str: '394454214132256768', source: 'web', retweet_count: 0, id: 394_454_214_132_256_768, created_at: 'Sun Oct 27 13:23:07 +0000 2013', in_reply_to_status_id_str: '394341960603172864', retweeted: false, in_reply_to_user_id: 18_845_675, truncated: false, contributors: nil, geo: nil, in_reply_to_user_id_str: '18845675', text: '@darrenliddell my programmers thought that they had that one covered. I have admonished them.'}, source: {default_profile_image: false, profile_text_color: '333333', created_at: 'Fri Nov 09 00:35:12 +0000 2007', is_translator: false, name: 'Adam Bird', screen_name: 'adambird', geo_enabled: true, follow_request_sent: false, profile_sidebar_border_color: 'C0DEED', default_profile: true, id: 10_083_602, contributors_enabled: false, followers_count: 1295, lang: 'en', profile_background_tile: false, url: 'http://about.me/adambird', profile_sidebar_fill_color: 'DDEEF6', listed_count: 53, utc_offset: 0, location: 'Nottingham, UK', time_zone: 'London', profile_background_color: 'C0DEED', following: false, protected: false, description: 'CEO @onediaryapp, ex @esendex CTO and co-founder, still cycling', profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_link_color: '0084B4', notifications: false, profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', favourites_count: 93, id_str: '10083602', statuses_count: 13_507, verified: false, profile_image_url: 'http://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', profile_use_background_image: true, profile_image_url_https: 'https://pbs.twimg.com/profile_images/378800000477232297/23d85bb78f71534eea1e1133fb771f86_normal.jpeg', friends_count: 851}, created_at: 'Sun Oct 27 21:05:35 +0000 2013', target: {default_profile_image: false, profile_text_color: '333333', created_at: 'Sat Mar 23 23:52:18 +0000 2013', is_translator: false, name: 'One Diary Bot', screen_name: 'onediarybot', geo_enabled: false, follow_request_sent: false, profile_sidebar_border_color: 'C0DEED', default_profile: true, id: 1_292_911_088, contributors_enabled: false, followers_count: 124, lang: 'en', profile_background_tile: false, url: 'http://www.onediary.com', profile_sidebar_fill_color: 'DDEEF6', listed_count: 1, utc_offset: nil, location: nil, time_zone: nil, profile_background_color: 'C0DEED', following: true, protected: false, description: "I'm the One Diary bot, here to help you with your life including personal cycling weather forecasts.", profile_background_image_url: 'http://abs.twimg.com/images/themes/theme1/bg.png', profile_link_color: '0084B4', notifications: false, profile_background_image_url_https: 'https://abs.twimg.com/images/themes/theme1/bg.png', favourites_count: 0, id_str: '1292911088', statuses_count: 9637, verified: false, profile_image_url: 'http://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', profile_use_background_image: true, profile_image_url_https: 'https://pbs.twimg.com/profile_images/3651575369/090551d8dd92080198f707769239ff43_normal.jpeg', friends_count: 157}}
      end

      it 'has the tweet as the target object' do
        expect(subject.target_object).to be_a(Twitter::Tweet)
        expect(subject.target_object.id).to eq(394_454_214_132_256_768)
      end
    end
  end
end
