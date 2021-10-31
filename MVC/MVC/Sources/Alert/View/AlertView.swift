//
//  AlertView.swift
//  MVC
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func backButtonAction()
    func continueButtonAction()
}

final class AlertView: RootAlertView {
    //MARK: - Properties
    private weak var delegate: AlertViewDelegate?

    //MARK: - Views
    //---EmojiImageView
    private let emojiImageView: MaskedImageView =  {
        let imageView = MaskedImageView(image: UIImage(named: "coolEmoji"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setShadows(color: UIColor.gray, offSet: CGSize(width: 10, height: 10), shadowOpacity: 10, shadowRadius: 20)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //---TitleLabel
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        let attributedString = NSMutableAttributedString(
            string: "",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        return label
    }()
    
    //---DescriptionLabel
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 3
        let attributedString = NSMutableAttributedString(
            string: "",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        return label
    }()
    
    //---CancelButton
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    //---RefuseButton
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    //---VerticalLineView
    private let verticalLineView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
    
    //---HorizontalView
    private let horizontalLineView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
    
    //--ButtonsStackView
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    //MARK: - Init
    init(subscriber: AlertViewDelegate) {
        super.init(widthMultiply: 0.77, heightMultiply: 1.0)
        self.delegate = subscriber
        setupButtons()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.hideOffSet = emojiImageView.frame.height / 2
    }
    
    //MARK: - Methods
    //--Buttons
    private func setupButtons() {
        backButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //--ButtonAction
    @objc private func buttonAction(sender: UIButton) {
        switch sender {
        case backButton:
            delegate?.backButtonAction()
        case continueButton:
            delegate?.continueButtonAction()
        default:
            return
        }
    }
    
    //---Layout
    private func setConstraints(){
        [
            buttonsStackView,
            emojiImageView,
            titleLabel,
            descriptionLabel,
            verticalLineView,
            horizontalLineView
        ].forEach{
            addSubview($0)
        }
        
        buttonsStackView.addArrangedSubview(backButton)
        buttonsStackView.addArrangedSubview(continueButton)
        
        //---Emoji Label
        NSLayoutConstraint.activate([
            emojiImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emojiImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -53),
            emojiImageView.widthAnchor.constraint(equalToConstant: 104),
            emojiImageView.heightAnchor.constraint(equalToConstant: 104*0.92)
        ])

        //---Title Label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            titleLabel.topAnchor.constraint(equalTo: emojiImageView.bottomAnchor, constant: 40)
        ])
        
        //---Description Label
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
        
        //---ButtonsStackView
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 48)
        ])

        //---HorizontalLineView
        NSLayoutConstraint.activate([
            horizontalLineView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            horizontalLineView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            horizontalLineView.topAnchor.constraint(equalTo: buttonsStackView.topAnchor),
            horizontalLineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        //---VerticalLineView
        NSLayoutConstraint.activate([
            verticalLineView.topAnchor.constraint(equalTo: horizontalLineView.topAnchor, constant: 0.5),
            verticalLineView.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor),
            verticalLineView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            verticalLineView.widthAnchor.constraint(equalToConstant: 0.5)
        ])
        
    }
    
    func update (model: AlertModel) {
        let titleAttributedString = NSMutableAttributedString (
            string: model.basecAlert.title,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        let descriptionAttributedString = NSMutableAttributedString (
            string: model.basecAlert.description,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        
        titleLabel.attributedText = titleAttributedString
        descriptionLabel.attributedText = descriptionAttributedString
        backButton.setTitle(model.basecAlert.backButtonText, for: .normal)
        continueButton.setTitle(model.basecAlert.continueText, for: .normal)
    }
}
