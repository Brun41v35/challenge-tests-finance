import UIKit

final class ActivityCellView: UITableViewCell {
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return stack
    }()

    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "bag.circle.fill")
        imageView.tintColor = .systemPurple
        return imageView
    }()

    lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Mall"
        return label
    }()

    lazy var activityInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "$100.00 • 8:57 AM"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator

        addSubviews()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ActivityCellView {
    func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(categoryImageView)
        mainStackView.addArrangedSubview(labelsStackView)

        labelsStackView.addArrangedSubview(activityNameLabel)
        labelsStackView.addArrangedSubview(activityInfoLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            categoryImageView.widthAnchor.constraint(equalToConstant: 50),
            categoryImageView.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}
