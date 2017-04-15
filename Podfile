use_frameworks!

workspace 'MusicNotationKit'

target 'MusicNotationKitiOS' do
    project 'MusicNotationKit/MusicNotationKit.xcodeproj'

    pod 'MusicNotationCore', :git => 'https://github.com/drumnkyle/music-notation-core.git', :branch => 'collectionConformance'

    target 'MusicNotationKitiOSTests' do
        pod 'MusicNotationCore', :git => 'https://github.com/drumnkyle/music-notation-core.git', :branch => 'collectionConformance'
    end
end

target 'MusicNotationKitSampleApp' do
    project 'MusicNotationKitSampleApp/MusicNotationKitSampleApp.xcodeproj'

    pod 'MusicNotationKit', :path => '.'
end

