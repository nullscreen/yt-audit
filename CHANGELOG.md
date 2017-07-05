# Changelog

All notable changes to this project will be documented in this file.

For more information about changelogs, check
[Keep a Changelog](http://keepachangelog.com) and
[Vandamme](http://tech-angels.github.io/vandamme).

## 0.5.5  - 2017-04-03

* [BUGFIX] Change `VideoAudit::InvideoProgramming` to count videos with a 'featured content' annotation, not 'branding' annotation.

## 0.5.4  - 2017-06-20

* [ENHANCEMENT] Change order of audits.

## 0.5.3  - 2017-06-19

* [FEATURE] Add `VideoAudit::InvideoProgramming` to count videos with a branding annotation.

## 0.5.2  - 2017-06-14

* [FEATURE] Add `VideoAudit::EndScreen` to count videos with end screens.
* [FEATURE] Add `VideoAudit::TagsLength` to count videos with more than 400 characters in tags.
* [FEATURE] Add `VideoAudit::SubscribeEndScreen` to count videos with a subscribe link in end screens.
* [FEATURE] Add `VideoAudit::VideoEndScreen` to count videos with a video link in end screens.
* [FEATURE] Add `VideoAudit::PlaylistEndScreen` to count videos with a playlist link in end screens.
* [FEATURE] Add `VideoAudit::WebsiteEndScreen` to count videos with a website link in end screens.

## 0.5.1  - 2017-05-03

* [ENHANCEMENT] Reduce API calls to YouTube using .count, not .size

## 0.5.0  - 2017-04-03

**How to upgrade**

If your code depends on the `yt` gem, ensure you switch to the `yt-core` gem.

* [ENHANCEMENT] Change dependency from 'yt' to the smaller 'yt-core'

## 0.4.0  - 2017-02-27

**How to upgrade**

If your code depends on the `yt` gem, ensure you use version 0.29.0 or higher.

* [ENHANCEMENT] Use new `yt-url` gem, extracted from `yt`

## 0.3.2  - 2017-02-26

* [ENHANCEMENT] Don't limit Yt dependency to 0.25.x

## 0.3.1  - 2016-04-04

* [BUGFIX] Fix condition of Youtube Association for invalid channel urls on the description.

## 0.3.0  - 2016-03-01

**How to upgrade**

When your code defines an `Yt::Audit` object, it should be initialized with a `Yt::Channel` object as `channel:` argument. It used to accept `channel_id` string directly but now your code should define a channel with it first.

* [ENHANCEMENT] Optionally send in `Yt::Collections::Videos` or `Yt::Collections::Playlists` object as arguments of an `Yt::Audit`, accompanied with `Yt::Models::Channel` object of yt.
* [ENHANCEMENT] Send in brand name as an optional argument.
* [BUGFIX] Fix videos input with longer description, for Youtube Association.

## 0.2.2  - 2016-02-24

* [BUGFIX] Fix condition of Info Card

## 0.2.1  - 2016-02-19

* [FEATURE] Add `PlaylistAudit::Descripton` for `run` to also count playlists with a description.

## 0.2.0  - 2016-02-18

**How to upgrade**

If your code calls any of `has_end_cards?`, `has_link_to_own_channel?`, `has_subscribe_annotations?`, `has_brand_anchoring?`, or `has_info_cards?` method with a video id, they are removed. Instead, call `run` method from a `Yt::Audit` instance to get information of a channel.

* [FEATURE] Add `run` method to audit a channel and count how many videos have each audit subject out of its recent 10 videos.
* [REMOVAL] Remove `has_end_cards?`
* [REMOVAL] Remove `has_link_to_own_channel?`
* [REMOVAL] Remove `has_subscribe_annotations?`
* [REMOVAL] Remove `has_brand_anchoring?`
* [REMOVAL] Remove `has_info_cards?`

## 0.1.5  - 2016-02-17

* [BUGFIX] Fix `has_end_cards?` for cases when Float `ends_at` is
  greater than Fixnum `duration`

## 0.1.4  - 2016-02-17

* [FEATURE] Add `has_end_cards?`

## 0.1.3  - 2016-02-16

* [FEATURE] Add `has_link_to_own_channel?`

## 0.1.2  - 2016-02-11

* [FEATURE] Add `has_subscribe_annotations?`

## 0.1.1  - Unreleased

* [ENHANCEMENT] Brand name case-insensitive in `has_brand_anchoring?`

## 0.1.0  - Unreleased

* [FEATURE] Add `has_info_cards?`
* [FEATURE] Add `has_brand_anchoring?`
