//
//  CalendarViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 27/06/23.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var currentDate: Date = {
        let currentDate = Date()
        return currentDate
    }()
    
    let customRoundedView: CustomView = {
        let view = CustomView()
        view.configure(with: CustomViewModel(leftButtonImage: nil, title: "Calendar", rightButtonImage: UIImage(named: "Settings")))
        view.backgroundColor = UIColor(named: "Grey70")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let scheduleHead: UILabel = {
        let scheduleHead = UILabel()
        scheduleHead.text = "Subs Schedule"
        scheduleHead.font = .systemFont(ofSize: 40.0, weight: .heavy)
        scheduleHead.textColor = .white
        scheduleHead.numberOfLines = 0
        scheduleHead.textAlignment = .left
        scheduleHead.translatesAutoresizingMaskIntoConstraints = false
        return scheduleHead
    }()
    
    let nSubsToday: UILabel = {
        let nSubsToday = UILabel()
        nSubsToday.text = "3 subscriptions for today."
        nSubsToday.font = .systemFont(ofSize: 14.0, weight: .semibold)
        nSubsToday.textColor = UIColor(named: "Grey30")
        nSubsToday.numberOfLines = 0
        nSubsToday.textAlignment = .left
        nSubsToday.translatesAutoresizingMaskIntoConstraints = false
        return nSubsToday
    }()
    
    var dropDownStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor(named: "Grey40")
        stackView.layer.cornerRadius = 14
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let monthNameButton: UIButton = {
        let monthName = UIButton()
        monthName.translatesAutoresizingMaskIntoConstraints = false
        return monthName
    }()
    
    let monthsTableView: UITableView = {
        let monthsTableView = UITableView()
        monthsTableView.backgroundColor = UIColor(named: "Grey40")
        monthsTableView.translatesAutoresizingMaskIntoConstraints = false
        return monthsTableView
    }()
    
    var daysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 52, height: 108)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Grey70")

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    var upcomingBillsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        layout.itemSize = CGSize(width: 170, height: 168)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Grey80")

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    let monthsData: [String] = ["January", "Febrarury", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var daysInMonth = 31
    var selectedMonth = 1
    var selectedDay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMonthBtn(monthName: "January")
        addViews()
        configureMonthTableView()
        configureCalenderCollectionView()
        configureUpcomingBillsCollectionView()
        addConstraints()
        addTargets()
    }
    
    func configureCalenderCollectionView() {
        daysCollectionView.delegate = self
        daysCollectionView.dataSource = self

        daysCollectionView.register(DaysCollectionViewCell.self, forCellWithReuseIdentifier: "DaysCollectionViewCell")
    }
    
    func configureMonthTableView() {
        monthsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        monthsTableView.delegate = self
        monthsTableView.dataSource = self
        monthsTableView.isHidden = true
    }
    
    func configureUpcomingBillsCollectionView() {
        upcomingBillsCollectionView.delegate = self
        upcomingBillsCollectionView.dataSource = self
        upcomingBillsCollectionView.register(ScheduledSubsCollectionViewCell.self, forCellWithReuseIdentifier: "ScheduledSubsCollectionViewCell")
        
        upcomingBillsCollectionView.register(UpcomingBillsHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "upcomingBillsHeader")
    }
    
    func configureMonthBtn(monthName: String) {
        let attributedString = NSMutableAttributedString(string: monthName)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 12),
            .foregroundColor: UIColor.white
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))

        monthNameButton.setAttributedTitle(attributedString, for: .normal)
        monthNameButton.setImage(UIImage(named: "Arrow"), for: .normal)
        monthNameButton.semanticContentAttribute = .forceRightToLeft
        monthNameButton.backgroundColor = UIColor(named: "Grey40")
        let imageInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        monthNameButton.imageEdgeInsets = imageInsets
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        monthNameButton.layer.cornerRadius = monthNameButton.frame.size.height / 2
        monthsTableView.layer.cornerRadius = monthsTableView.frame.size.height / 2
    }
    
    func addViews() {
        view.backgroundColor = UIColor(named: "Grey80")
        view.addSubview(customRoundedView)
        customRoundedView.addSubview(scheduleHead)
        customRoundedView.addSubview(nSubsToday)
        customRoundedView.addSubview(dropDownStackView)
        dropDownStackView.addArrangedSubview(monthNameButton)
        dropDownStackView.addArrangedSubview(monthsTableView)
        customRoundedView.addSubview(daysCollectionView)
        view.addSubview(upcomingBillsCollectionView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            customRoundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customRoundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customRoundedView.topAnchor.constraint(equalTo: view.topAnchor),
            customRoundedView.heightAnchor.constraint(equalToConstant: 430),
            
            scheduleHead.leadingAnchor.constraint(equalTo: customRoundedView.leadingAnchor, constant: 24),
            scheduleHead.topAnchor.constraint(equalTo: customRoundedView.topAnchor, constant: 115),
            scheduleHead.trailingAnchor.constraint(equalTo: customRoundedView.trailingAnchor, constant: -167),
            
            nSubsToday.leadingAnchor.constraint(equalTo: customRoundedView.leadingAnchor, constant: 24),
            nSubsToday.topAnchor.constraint(equalTo: scheduleHead.bottomAnchor, constant: 20),
            
//            dropDownStackView.topAnchor.constraint(equalTo: customRoundedView.topAnchor, constant: 190),
            dropDownStackView.centerYAnchor.constraint(equalTo: nSubsToday.centerYAnchor),
            dropDownStackView.trailingAnchor.constraint(equalTo: customRoundedView.trailingAnchor, constant: -24),
            //          dropDownStackView.heightAnchor.constraint(equalToConstant: 100.0),
            dropDownStackView.widthAnchor.constraint(equalToConstant: 95.0),

            monthNameButton.widthAnchor.constraint(equalToConstant: 90),
            monthNameButton.heightAnchor.constraint(equalToConstant: 32),
            
            monthsTableView.leadingAnchor.constraint(equalTo: dropDownStackView.leadingAnchor),
            monthsTableView.trailingAnchor.constraint(equalTo: dropDownStackView.trailingAnchor),
            monthsTableView.topAnchor.constraint(equalTo: monthNameButton.bottomAnchor),
            monthsTableView.bottomAnchor.constraint(equalTo: dropDownStackView.bottomAnchor),
            monthsTableView.heightAnchor.constraint(equalToConstant: 75.0),
            
            daysCollectionView.leadingAnchor.constraint(equalTo: customRoundedView.leadingAnchor, constant: 24),
            daysCollectionView.trailingAnchor.constraint(equalTo: customRoundedView.trailingAnchor, constant: -24),
            daysCollectionView.bottomAnchor.constraint(equalTo: customRoundedView.bottomAnchor, constant: -32),
            daysCollectionView.heightAnchor.constraint(equalToConstant: 120),
            daysCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 48),
            
            upcomingBillsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upcomingBillsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upcomingBillsCollectionView.topAnchor.constraint(equalTo: customRoundedView.bottomAnchor),
            upcomingBillsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
    func addTargets() {
        monthNameButton.addTarget(self, action: #selector(showTableView), for: .touchUpInside)
    }
    
    @objc func showTableView() {
        monthsTableView.isHidden = !monthsTableView.isHidden
    }
    
    func dayOfWeek(date: Int, month: Int) -> String? {
        let currentYear = Calendar.current.component(.year, from: currentDate)
        guard let date = Calendar.current.date(from: DateComponents(year: currentYear, month: month, day: date)) else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from: date)
    }
    
    func countOfDaysInMonth(month: Int) -> Int? {
        let currentYear = Calendar.current.component(.year, from: currentDate)
        let curentMonth = Calendar.current.component(.month, from: currentDate)
        let todayDate = Calendar.current.component(.day, from: currentDate)
        guard let date = Calendar.current.date(from: DateComponents(year: currentYear, month: month)) else {
            return nil
        }
        let range = Calendar.current.range(of: .day, in: .month, for: date)
        if curentMonth == month {
            return abs((range?.count ?? 0) - todayDate) + 1
        }
        return range?.count
    }
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == monthsTableView {
            return monthsData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == monthsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = monthsData[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
            cell.textLabel?.textColor = .white
            cell.backgroundColor = UIColor(named: "Grey40")
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == monthsTableView {
            selectedDay = 0
            daysInMonth = countOfDaysInMonth(month: indexPath.row + 1) ?? 0
            selectedMonth = indexPath.row + 1
            if let cell = tableView.cellForRow(at: indexPath) {
                configureMonthBtn(monthName: cell.textLabel?.text ?? "January")
            }
            monthsTableView.isHidden = true
            daysCollectionView.reloadData()
            upcomingBillsCollectionView.reloadData()
        }
    }
    
}


extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == daysCollectionView {
            return daysInMonth
        } else {
            return 3
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == daysCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCollectionViewCell", for: indexPath) as? DaysCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.layer.cornerRadius = 10
            let todayDate = Calendar.current.component(.day, from: currentDate)
            let currentMonth = Calendar.current.component(.month, from: currentDate)
            var image: UIImage? = nil
            let title: String?
            let subtitle: String?
            var color: UIColor? = UIColor(named: "Grey50")
            if selectedDay == indexPath.row {
                image = UIImage(named: "Vector")
                color = UIColor(named: "Grey40")
            } else {
                image = nil
                color = UIColor(named: "Grey50")
            }
            if currentMonth == selectedMonth {
                title = String(indexPath.row + todayDate)
                subtitle = dayOfWeek(date: indexPath.row + todayDate, month: selectedMonth)
            } else {
                title = String(indexPath.row + 1)
                subtitle = dayOfWeek(date: indexPath.row + 1, month: selectedMonth)
            }
            
            cell.configure(with: DaysCollectionViewCellModel(title: title, subtitle: subtitle, image: image, backgroundColor: color))
            
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduledSubsCollectionViewCell", for: indexPath) as? ScheduledSubsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = UIColor(named: "Grey70")
            cell.layer.cornerRadius = 10
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == daysCollectionView {
            selectedDay = indexPath.row

            if let selectedCell = collectionView.cellForItem(at: indexPath) as? DaysCollectionViewCell {
                selectedCell.cellImageView.image = UIImage(named: "Vector")
                selectedCell.backgroundColor = UIColor(named: "Grey40")
            }
            daysCollectionView.reloadData()
        }
        upcomingBillsCollectionView.reloadData()
    }


        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            if let cell = collectionView.cellForItem(at: indexPath) as? DaysCollectionViewCell {
                cell.cellImageView.image = nil
                cell.backgroundColor = UIColor(named: "Grey50")
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if collectionView == upcomingBillsCollectionView {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "upcomingBillsHeader", for: indexPath) as! UpcomingBillsHeaderCollectionReusableView
                headerView.monthNameLabel.text = monthsData[selectedMonth-1]
                let currentMonth = Calendar.current.component(.month, from: currentDate)
                let presentDate = Calendar.current.component(.day, from: currentDate)
                if currentMonth == selectedMonth {
                    headerView.dateLabel.text = "\(selectedDay+presentDate).\(selectedMonth).2023"
                } else {
                    headerView.dateLabel.text = "\(selectedDay+1).\(selectedMonth).2023"
                }
                
                headerView.backgroundColor = UIColor(named: "Grey80")
                return headerView
            }
        default:
            break
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == upcomingBillsCollectionView {
            return CGSize(width: collectionView.bounds.width, height: 90)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.frame.size.width
        if collectionView == upcomingBillsCollectionView {
            return CGSize(width: (screenWidth / 2) - 28, height: 168)
        } else if collectionView == daysCollectionView {
            return CGSize(width: 52, height: 108)
        } else {
            return CGSize.zero
        }
    }
    
    
}



