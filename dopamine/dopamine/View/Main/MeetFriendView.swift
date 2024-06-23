//
//  MeetFriendView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct MeetFriendView: View {
    @State private var selectedImage = UIImage()
    @State private var isShowPhotoLibrary: Bool = false
    @State private var isShowSearchView: Bool = false
    @State private var result = "First you've to select an image"
    @State private var imageURL: String = ""
    @State private var isNextView: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("친구와의 만남😎")
                            .font(.system(size: 24, weight: .semibold))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 30)
                        
                        Text("목표 만남 : 1회, 1시간 이상")
                            .foregroundStyle(.aqua)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.leading, 30)
                    }
                    Spacer()
                }
                .onTapGesture {
                    isNextView = true
                }
                
                Text("오늘 친구와 1시간 이상 만나고\n사진을 통해 인증해 주세요!")
                    .foregroundStyle(Color(uiColor: .systemGray4))
                    .font(.system(size: 18, weight: .regular))
                
                Button {
                    isShowPhotoLibrary = true
                } label: {
                    Text("사진인증")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 171, height: 74)
                        .background(.aqua)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePickerView(
                        result: $result,
                        selectedImage: $selectedImage,
                        sourceType: .photoLibrary
                    )
                }
                .navigationDestination(
                    isPresented: $isNextView
                ) {
                    MeetFirendCompleatView()
                }
                
                
            }
        }
        .navigationTitle("오늘의 도파민 미션🔥")
    }
}

#Preview {
    MeetFriendView()
}
